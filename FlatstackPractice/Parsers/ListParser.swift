//
//  ListParser.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 30.06.2022.
//

import Foundation
import SwiftyJSON

protocol ListParser {
    func parseList(json: JSON) -> CountryList
}

struct DefaultListParser: ListParser {
    
    let countryParser: CountryParser
    
    private enum Keys {
        static let countries = "countries"
        static let next = "next"
    }
    
    func parseList(json: JSON) -> CountryList {
        return CountryList(countries: countryParser.parseCountries(json: json[Keys.countries]), next: json[Keys.next].stringValue)
    }
}
