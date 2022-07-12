//
//  CountryListPresenterMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice

class CountryListPresenterMock: CountryListPresentationLogic {
    
    private(set) var isPresentFetchedCountriesCalled = false
    private(set) var isPresentLoadingMoreStateCalled = false
    
    func presentFetchedCountries(response: CountryListModels.Response) {
        isPresentFetchedCountriesCalled = true
    }
    
    func presentLoadingMoreState() {
        isPresentLoadingMoreStateCalled = true
    }

}
