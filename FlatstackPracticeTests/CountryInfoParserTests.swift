//
//  CountryInfoParserTests.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice
import XCTest
import SwiftyJSON

class CountryInfoParserTests: XCTestCase {
    
    private var countryInfoParser: CountryInfoParser!
    
    override func setUpWithError() throws {
        let defaultCountryInfoParser = DefaultCountryInfoParser()
        countryInfoParser = defaultCountryInfoParser
    }

    override func tearDownWithError() throws {
        countryInfoParser = nil
    }
    
    func testParseCountryInfo() {
        //Given
        let expectedFlag = "expected"
        let expectedImages = ["1","2"]
        let json = JSON(["images" : expectedImages, "flag" : expectedFlag])
        //When
        let countryInfo = countryInfoParser.parseCountryInfo(json: json)
        //Then
        XCTAssertEqual(countryInfo.flag, expectedFlag)
        XCTAssertEqual(countryInfo.images?.count, expectedImages.count)
    }
}
