//
//  ViewController.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import UIKit
import SnapKit

protocol CountryListDisplayLogic: AnyObject {
    
}

class CountryListViewController: UIViewController {

    var tableView: UITableView = {
        let table = UITableView()
        table.register(CountryListTableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    let countryArray: [Country] = [
        Country(name: "Абхазия", continent: "Eurasia", capital: "Сухум", population: 10000, descriptionSmall: "Республика Абхазия - частично признанное независимое государство. Кем не признано - для тех это Автономная Республика Абхазия в составе Грузии, причем оккупированная Россией.", description: "as", image: "http://landmarks.ru/wp-content/uploads/2015/05/abhaziya.jpg", countryInfo: CountryInfo(images: [], flag: "http://www.flagistrany.ru/data/flags/ultra/by.png")),
        Country(name: "Абхазия", continent: "Eurasia", capital: "Сухум", population: 10000, descriptionSmall: "Республика Абхазия - частично признанное независимое государство. Кем не признано - для тех это Автономная Республика Абхазия в составе Грузии, причем оккупированная Россией.", description: "as", image: "http://landmarks.ru/wp-content/uploads/2015/05/abhaziya.jpg", countryInfo: CountryInfo(images: [], flag: "http://www.flagistrany.ru/data/flags/ultra/by.png")),
        Country(name: "Абхазия", continent: "Eurasia", capital: "Сухум", population: 10000, descriptionSmall: "", description: "as", image: "http://landmarks.ru/wp-content/uploads/2015/05/abhaziya.jpg", countryInfo: CountryInfo(images: [], flag: "http://www.flagistrany.ru/data/flags/ultra/by.png")),
    ]
    
    override func loadView() {
        self.view = UIView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
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
    
}

extension CountryListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let country = countryArray[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CountryListTableViewCell else { return UITableViewCell() }
        cell.configureCellData(country: country)
        return cell
    }
    
}

