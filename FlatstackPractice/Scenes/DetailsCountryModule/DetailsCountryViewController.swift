//
//  DetailsCountryViewController.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation
import UIKit
import SnapKit

protocol DetailsCountryDisplayLogic: AnyObject {
    func displayCountry(viewModel: DetailsCountryModels.ViewModel)
}

class DetailsCountryViewController: UIViewController, DetailsCountryDisplayLogic {
    
    var interactor: DetailsCountryBusinessLogic?
    var router: (DetailsCountryRoutingLogic & DetailsCountryDataPassing)?
    
    let scrollView = UIScrollView()
    let nameLabel = UILabel()
    let starImageView = UIImageView()
    let capitalLabel = UILabel()
    let capitalNameLabel = UILabel()
    let smileImageView = UIImageView()
    let populationLabel = UILabel()
    let populationNumberLabel = UILabel()
    let earthImageView = UIImageView()
    let continentLabel = UILabel()
    let continentNameLabel = UILabel()
    let countryDescriptionLabel = UILabel()
    let aboutLabel = UILabel()
    let contentView = UIView()
    let firstLine = UIView()
    let secondLine = UIView()
    let thirdLine = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        getCountry()
    }
    
    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = .white
    }
    
    private func configureContentView() {
        view.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.width.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func configureScrollView() {
        contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func configureNameLabel() {
        contentView.addSubview(nameLabel)
        nameLabel.font = UIFont(name: "Helvetica", size: 22)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureStarImageView() {
        contentView.addSubview(starImageView)
        starImageView.image = UIImage(named: "star")
        starImageView.snp.makeConstraints { make in
            make.height.width.equalTo(22)
            make.top.equalTo(nameLabel).inset(40)
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureCapitalLabel() {
        contentView.addSubview(capitalLabel)
        capitalLabel.font = UIFont(name: "Helvetica", size: 17)
        capitalLabel.text = "Capital"
        capitalLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).inset(40)
            make.leading.equalTo(starImageView).inset(30)
        }
    }
    
    private func configureCapitalNameLabel() {
        contentView.addSubview(capitalNameLabel)
        capitalNameLabel.font = UIFont(name: "Helvetica", size: 17)
        capitalNameLabel.textColor = .gray
        capitalNameLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).inset(40)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func configureSmileImageView() {
        contentView.addSubview(smileImageView)
        smileImageView.image = UIImage(named: "smile")
        smileImageView.snp.makeConstraints { make in
            make.height.width.equalTo(22)
            make.top.equalTo(starImageView).inset(40)
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configurePopulationLabel() {
        contentView.addSubview(populationLabel)
        populationLabel.font = UIFont(name: "Helvetica", size: 17)
        populationLabel.text = "Population"
        populationLabel.snp.makeConstraints { make in
            make.top.equalTo(starImageView).inset(40)
            make.leading.equalTo(smileImageView).inset(30)
        }
    }
    
    private func configurePopulationNumberLabel() {
        contentView.addSubview(populationNumberLabel)
        populationNumberLabel.font = UIFont(name: "Helvetica", size: 17)
        populationNumberLabel.textColor = .gray
        populationNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(starImageView).inset(40)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func configureEarthImageView() {
        contentView.addSubview(earthImageView)
        earthImageView.image = UIImage(named: "planet")
        earthImageView.snp.makeConstraints { make in
            make.height.width.equalTo(22)
            make.top.equalTo(smileImageView).inset(40)
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureContinentLabel() {
        contentView.addSubview(continentLabel)
        continentLabel.font = UIFont(name: "Helvetica", size: 17)
        continentLabel.text = "Continent"
        continentLabel.snp.makeConstraints { make in
            make.top.equalTo(populationLabel).inset(40)
            make.leading.equalTo(earthImageView).inset(30)
        }
    }
    
    private func configureContinentNameLabel() {
        contentView.addSubview(continentNameLabel)
        continentNameLabel.font = UIFont(name: "Helvetica", size: 17)
        continentNameLabel.textColor = .gray
        continentNameLabel.snp.makeConstraints { make in
            make.top.equalTo(populationNumberLabel).inset(40)
            make.trailing.equalToSuperview().inset(15)
        }
    }
    private func configureAboutLabel() {
        contentView.addSubview(aboutLabel)
        aboutLabel.font = UIFont(name: "Helvetica", size: 15)
        aboutLabel.text = "About"
        aboutLabel.snp.makeConstraints { make in
            make.top.equalTo(earthImageView).inset(50)
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureCountryDescriptionLabel() {
        contentView.addSubview(countryDescriptionLabel)
        countryDescriptionLabel.font = UIFont(name: "Helvetica", size: 15)
        countryDescriptionLabel.numberOfLines = 0
        countryDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(aboutLabel).inset(25)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureFirstLine() {
        contentView.addSubview(firstLine)
        firstLine.backgroundColor = .gray.withAlphaComponent(0.2)
        firstLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(starImageView).inset(30)
            make.width.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureSecondLine() {
        contentView.addSubview(secondLine)
        secondLine.backgroundColor = .gray.withAlphaComponent(0.2)
        secondLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(smileImageView).inset(30)
            make.width.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configureThirdLine() {
        contentView.addSubview(thirdLine)
        thirdLine.backgroundColor = .gray.withAlphaComponent(0.2)
        thirdLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(earthImageView).inset(30)
            make.width.equalToSuperview()
            make.leading.equalToSuperview().inset(15)
        }
    }
    
    private func configure() {
        configureContentView()
        configureScrollView()
        configureNameLabel()
        configureStarImageView()
        configureCapitalLabel()
        configureCapitalNameLabel()
        configureSmileImageView()
        configurePopulationLabel()
        configurePopulationNumberLabel()
        configureEarthImageView()
        configureContinentLabel()
        configureContinentNameLabel()
        configureAboutLabel()
        configureCountryDescriptionLabel()
        configureFirstLine()
        configureSecondLine()
        configureThirdLine()
    }
    
    func displayCountry(viewModel: DetailsCountryModels.ViewModel) {
        let displayCountry = viewModel
        nameLabel.text = displayCountry.name
        capitalNameLabel.text = displayCountry.capital
        continentNameLabel.text = displayCountry.continent
        populationNumberLabel.text = "\(displayCountry.population)"
        countryDescriptionLabel.text = displayCountry.description
    }
    
    func getCountry() {
        let request = DetailsCountryModels.Request()
        interactor?.getCountry(request: request)
    }
}
