//
//  CountryListInteractorTests.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
import XCTest
@testable import FlatstackPractice
import SwiftyJSON

class CountryListInteractorTests: XCTestCase {
    
    private var interactor: (CountryListBusinessLogic & CountryListDataStore)!
    private var presenter: CountryListPresenterMock!
    private var service: CountryServiceMock!
    
    override func setUpWithError() throws {
        let countryListInteractor = CountryListInteractor()
        let countryListPresenterMock = CountryListPresenterMock()
        let countryServiceMock = CountryServiceMock()
        
        countryListInteractor.presenter = countryListPresenterMock
        countryListInteractor.countryService = countryServiceMock
        
        interactor = countryListInteractor
        presenter = countryListPresenterMock
        service = countryServiceMock
    }

    override func tearDownWithError() throws {
        interactor = nil
        presenter = nil
        service = nil
    }
    
    func testFetchBackendCountryListSuccess() {
        //Given
        let request = CountryListModels.FetchCountries.Request()
        let expectedNext = "expected"
        let expectedFirstName = "Russia"
        let expectedSecondName = "Spain"
        let expectedCountries: [Country] = [Country(name: expectedFirstName), Country(name: expectedSecondName)]
        let expectation = expectation(description: "Fetching backend countries")
        service.countryList = CountryList(countries: expectedCountries, next: expectedNext)
        service.error = nil
        service.closure = {
            expectation.fulfill()
        }
        //When
        interactor.fetchBackendCountryList(request: request)
        //Then
        waitForExpectations(timeout: 2)
        XCTAssertTrue(presenter.isPresentLoadingMoreStateCalled)
        XCTAssertTrue(service.isFetchCountryListCalled)
        XCTAssertNotNil(interactor.countryList)
        XCTAssertEqual(interactor.countryList?.countries.count, expectedCountries.count)
        XCTAssertTrue(presenter.isPresentFetchedCountriesCalled)
    }
    
    func testFetchBackendCountryListFail() {
        //Given
        let request = CountryListModels.FetchCountries.Request()
        let expectation = expectation(description: "Fetching backend countries")
        service.countryList = nil
        service.error = SwiftyJSONError(rawValue: 1)
        service.closure = {
            expectation.fulfill()
        }
        //When
        interactor.fetchBackendCountryList(request: request)
        //Then
        waitForExpectations(timeout: 2)
        XCTAssertTrue(presenter.isPresentLoadingMoreStateCalled)
        XCTAssertTrue(service.isFetchCountryListCalled)
        XCTAssertNil(interactor.countryList)
    }
    
    func testFetchBackendCountryListSuccessWithCountryList() {
        //Given
        let request = CountryListModels.FetchCountries.Request()
        let expectedNext = "expected"
        let expectedFirstName = "Russia"
        let expectedSecondName = "Spain"
        let expectedCountries: [Country] = [Country(name: expectedFirstName), Country(name: expectedSecondName)]
        let expectedCountryList = CountryList(countries: expectedCountries, next: expectedNext)
        let expectation = expectation(description: "Fetching backend countries")
        service.countryList = CountryList(countries: expectedCountries, next: expectedNext)
        service.error = nil
        service.closure = {
            expectation.fulfill()
        }
        interactor.countryList = expectedCountryList
        //When
        interactor.fetchBackendCountryList(request: request)
        //Then
        waitForExpectations(timeout: 2)
        XCTAssertTrue(presenter.isPresentLoadingMoreStateCalled)
        XCTAssertTrue(service.isFetchCountryListCalled)
        XCTAssertNotNil(interactor.countryList)
        XCTAssertGreaterThan(interactor.countryList!.countries.count, expectedCountries.count)
        XCTAssertTrue(presenter.isPresentFetchedCountriesCalled)
    }
}

