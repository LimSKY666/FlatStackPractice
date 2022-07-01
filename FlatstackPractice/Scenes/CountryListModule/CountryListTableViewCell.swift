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
    let descriptionTextField = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFlagImageView() {
        addSubview(flagImageView)
        flagImageView.snp.makeConstraints { make in
            make.height.equalTo(34)
            make.width.equalTo(50)
            make.left.top.equalToSuperview().inset(15)
        }
    }
    
    func conigureNameLabel() {
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.left.equalTo(flagImageView).inset(10)
            make.bottom.equalTo(capitalLabel).inset(5)
        }
    }
    
    func configureCapitalLabel() {
        addSubview(capitalLabel)
        capitalLabel.snp.makeConstraints { make in
            make.top.equalTo(flagImageView).inset(10)
        }
    }
    
    func configureDescriptionTextField() {
        addSubview(descriptionTextField)
    }
    
    func configure() {
        configureFlagImageView()
        conigureNameLabel()
        configureCapitalLabel()
        configureDescriptionTextField()
    }
    
    func configureCellData(country: Country) {
        flagImageView.kf.setImage(with: URL(string: country.image))
        nameLabel.text = country.name
        capitalLabel.text = country.capital
        descriptionTextField.text = country.descriptionSmall
    }
    
}
