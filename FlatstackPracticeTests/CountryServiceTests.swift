//
//  CountryServiceTests.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import XCTest
@testable import FlatstackPractice

class CountryServiceTests: XCTestCase {
    
    private var countryService: CountryService!
    private var listParser: ListParserMock!
    

    override func setUpWithError() throws {
        listParser = ListParserMock()
        countryService = DefaultCountryService(listParser: listParser)
    }

    override func tearDownWithError() throws {
        countryService = nil
        listParser = nil
    }

    func testFetchCountryListSuccess() {
        
    }
}

