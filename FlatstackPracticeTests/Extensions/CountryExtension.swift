//
//  CountryExtension.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice

extension Country {
    init(name: String) {
        self.init(name: name, continent: "America", capital: "Washington", population: 150, descriptionSmall: "Baiden", description: "Abama", image: "error", countryInfo: CountryInfo(images: nil, flag: "white"))
    }
}
