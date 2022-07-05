//
//  ViewController.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import UIKit
import SnapKit

protocol CountryListDisplayLogic: AnyObject {
    func displayFetchedCountries(viewModel: FetchCountries.ViewModel)
}

class CountryListViewController: UIViewController, CountryListDisplayLogic {

    var interactor: CountryListBusinessLogic?
    var router: CountryListRouter?
    var displayedCountries: [FetchCountries.ViewModel.DisplayedCountries] = []

    var tableView: UITableView = {
        let table = UITableView()
        table.register(CountryListTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCountries()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableView.automaticDimension
        tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        setTableViewDelegates()
    }
    
    private func setTableViewDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func fetchCountries() {
        let request = FetchCountries.Request()
        interactor?.fetchBackendCountryList(request: request)
    }
    
    func displayFetchedCountries(viewModel: FetchCountries.ViewModel) {
        displayedCountries = viewModel.displayedCountries
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedCountries.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayCountry = displayedCountries[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryListTableViewCell else { return UITableViewCell() }
        cell.configureCellData(viewModel: displayCountry)
        return cell
    }
}

