//
//  CountryListAssemblyTests.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import XCTest
@testable import FlatstackPractice
import Foundation

class CountryListAssemblyTests: XCTestCase {
    
    private var assembly: CountryListModuleAssembly!
    
    override func setUpWithError() throws {
        let countryListAssembly = DefaultCountryListAssembly()
        assembly = countryListAssembly
    }
    
    override func tearDownWithError() throws {
        assembly = nil
    }
    
    func testAssembe() {
        //Given

        //When
        let actualViewController = assembly.assemble()
        //Then
        let countryListViewController = actualViewController as! CountryListViewController
        XCTAssertTrue(actualViewController is CountryListViewController)
        XCTAssertTrue(countryListViewController.interactor is CountryListInteractor)
        XCTAssertTrue(countryListViewController.router is CountryListRouter)
        let interactor = countryListViewController.interactor as! CountryListInteractor
        XCTAssertTrue(interactor.presenter is CountryListPresenter)
    }
}

