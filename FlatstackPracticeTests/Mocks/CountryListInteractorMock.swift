//
//  CountryListInteractorMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice

class CountryListInteractorMock: CountryListBusinessLogic {
    
    private(set) var isFetchCountryListCalled = false
    private(set) var isFetchBackendCountryListCalled = false
    private(set) var isRefreshCountryListCalled = false
    
    func fetchCountryList(request: CountryListModels.FetchCountries.Request) {
        isFetchCountryListCalled = true
    }
    
    func fetchBackendCountryList(request: CountryListModels.FetchCountries.Request) {
        isFetchBackendCountryListCalled = true
    }
    
    func refreshCountryList(request: CountryListModels.RefreshCountries.Request) {
        isRefreshCountryListCalled = true
    }
    
}
