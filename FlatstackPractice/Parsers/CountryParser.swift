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
    
    let countryInfoParser = DefaultCountryInfoParser()
    
    private enum Keys {
        static let name = "name"
        static let continent = "continent"
        static let capital = "capital"
        static let population = "population"
        static let description_small = "description_small"
        static let description = "description"
        static let image = "image"
        static let country_info = "country_info"
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
                       capital: json[Keys.continent].stringValue,
                       population: json[Keys.population].intValue,
                       description_small: json[Keys.description_small].stringValue,
                       description: json[Keys.description].stringValue,
                       image: json[Keys.image].stringValue,
                       country_info: countryInfoParser.parseCountryInfo(json: json))
    }
    
}
