//
//  CountryInfoParser.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 30.06.2022.
//

import Foundation
import SwiftyJSON

protocol CountryInfoParser {
    func parseCountryInfo(json: JSON) -> CountryInfo
}

struct DefaultCountryInfoParser: CountryInfoParser {
    
    private enum Keys {
        static let images = "images"
        static let flag = "flag"
    }
    
    func parseCountryInfo(json: JSON) -> CountryInfo {
        return CountryInfo(images: json[Keys.images].rawValue as? [String], flag: json[Keys.flag].stringValue)
    }
}
