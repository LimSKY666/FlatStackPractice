//
//  CountryInfoParserMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice
import SwiftyJSON

class CountryInfoParserMock: CountryInfoParser {
    
    private(set) var isParseCountryInfoCalled = false
    
    func parseCountryInfo(json: JSON) -> CountryInfo {
        isParseCountryInfoCalled = true
        return CountryInfo(images: nil, flag: "flag")
    }
}

