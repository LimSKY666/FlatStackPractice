//
//  CountryListPresenterTests.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice
import XCTest

class CountryListPresenterTests: XCTestCase {
    
    private var presenter: CountryListPresentationLogic!
    private var viewController: CountryListViewControllerMock!
    
    override func setUpWithError() throws {
        let countryListPresenter = CountryListPresenter()
        let countryListViewController = CountryListViewControllerMock()
        
        countryListPresenter.countryListViewController = countryListViewController
        
        viewController = countryListViewController
        presenter = countryListPresenter
    }

    override func tearDownWithError() throws {
        presenter = nil
        viewController = nil
    }
    
    func testPresentFetchedCountries() {
        //Given
        let expectedFirstName = "America"
        let expectedSecoundName = "Russia"
        let countries: [Country] = [Country(name: expectedFirstName), Country(name: expectedSecoundName)]
        let response = CountryListModels.Response(countries: countries)
        //When
        presenter.presentFetchedCountries(response: response)
        //Then
        XCTAssertTrue(viewController.isDisplayFetchedCountriesCalled)
        XCTAssertTrue(viewController.isHideFooterCalled)
        XCTAssertEqual(viewController.viewModel.displayedCountries[0].name, expectedFirstName)
    }
    
    func testPresentLoadingMoreState() {
        //Given
        
        //When
        presenter.presentLoadingMoreState()
        //Then
        XCTAssertTrue(viewController.isDisplayTableFooterViewCalled)
    }
}

