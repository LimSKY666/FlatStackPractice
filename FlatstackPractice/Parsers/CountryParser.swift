//
//  CountryParcer.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 30.06.2022.
//

import Foundation
import SwiftyJSON

protocol CountryParser {
    func parseCountries(json: JSON) -> [Country]
    func parseCountry(json: JSON) -> Country
}

struct DefaultCountryParser: CountryParser {
    
    let countryInfoParser: CountryInfoParser
    
    private enum Keys {
        static let name = "name"
        static let continent = "continent"
        static let capital = "capital"
        static let population = "population"
        static let descriptionSmall = "description_small"
        static let description = "description"
        static let image = "image"
        static let countryInfo = "country_info"
    }
    
    func parseCountries(json: JSON) -> [Country] {
        var countries = [Country]()
        for country in json.arrayValue {
            countries.append(parseCountry(json: country))
        }
        return countries
    }
    
    func parseCountry(json: JSON) -> Country {
        
        return Country(name: json[Keys.name].stringValue,
                       continent: json[Keys.continent].stringValue,
                       capital: json[Keys.capital].stringValue,
                       population: json[Keys.population].intValue,
                       descriptionSmall: json[Keys.descriptionSmall].stringValue,
                       description: json[Keys.description].stringValue,
                       image: json[Keys.image].stringValue,
                       countryInfo: countryInfoParser.parseCountryInfo(json: json))
    }
    
}
