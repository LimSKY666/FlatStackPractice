//
//  CountryParserMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
import SwiftyJSON
@testable import FlatstackPractice

class CountryParserMock: CountryParser {
    
    private(set) var isParseCountriesCalled = false
    private(set) var isParseCountryCalled = false
    
    func parseCountries(json: JSON) -> [Country] {
        isParseCountriesCalled = true
        return [Country(name: "America"), Country(name: "Russia")]
    }

    func parseCountry(json: JSON) -> Country {
        isParseCountryCalled = true
        return Country(name: "Expected")
    }
}

