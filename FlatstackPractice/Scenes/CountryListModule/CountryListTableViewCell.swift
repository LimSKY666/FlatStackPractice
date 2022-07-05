//
//  CountryListTableViewCell.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 30.06.2022.
//

import UIKit
import SnapKit
import Kingfisher

class CountryListTableViewCell: UITableViewCell {
    
    let flagImageView = UIImageView()
    let nameLabel = UILabel()
    let capitalLabel = UILabel()
    let descriptionTextField = UILabel()
    let arrowImageView = UIImageView()
    let activityIndicator = UIActivityIndicatorView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFlagImageView() {
        addSubview(flagImageView)
        flagImageView.snp.makeConstraints { make in
            make.height.equalTo(34)
            make.width.equalTo(50)
            make.left.top.equalToSuperview().inset(15)
        }
    }
    
    private func conigureNameLabel() {
        addSubview(nameLabel)
        nameLabel.font = UIFont(name: "Helvetica", size: 17)
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.left.equalTo(flagImageView).inset(60)
            make.top.equalTo(15)
        }
    }
    
    private func configureCapitalLabel() {
        addSubview(capitalLabel)
        capitalLabel.font = UIFont(name: "Helvetica", size: 14)
        capitalLabel.textColor = .gray
        capitalLabel.snp.makeConstraints { make in
            make.height.equalTo(16)
            make.top.equalTo(nameLabel).inset(19)
            make.left.equalTo(flagImageView).inset(60)
        }
    }
    
    private func configureDescriptionLabel() {
        addSubview(descriptionTextField)
        descriptionTextField.font = UIFont(name: "Helvetica", size: 15)
        descriptionTextField.numberOfLines = 0
        descriptionTextField.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(15)
            make.top.equalTo(flagImageView).inset(45)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    private func configureArrowImageView() {
        addSubview(arrowImageView)
        arrowImageView.image = UIImage(named: "arrow")
        arrowImageView.snp.makeConstraints { make in
            make.height.equalTo(13)
            make.width.equalTo(8)
            make.top.equalToSuperview().inset(24)
            make.right.equalToSuperview().inset(15)
        }
    }
    
    private func configure() {
        configureFlagImageView()
        conigureNameLabel()
        configureCapitalLabel()
        configureDescriptionLabel()
        configureArrowImageView()
    }
    
    func configureCellData(viewModel: FetchCountries.ViewModel.DisplayedCountries) {
        flagImageView.kf.setImage(with: URL(string: viewModel.flag))
        nameLabel.text = viewModel.name
        capitalLabel.text = viewModel.capital
        descriptionTextField.text = viewModel.description
    }
    
}
