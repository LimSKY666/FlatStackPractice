//
//  ListParserMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice
import SwiftyJSON

class ListParserMock: ListParser {
    
    private(set) var isParseListCalled = false
    
    func parseList(json: JSON) -> CountryList {
        isParseListCalled = true
        return CountryList()
    }
}
