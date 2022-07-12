//
//  CountryServiceMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice

class CountryServiceMock: CountryService {
    
    private(set) var isFetchCountryListCalled = false
    var countryList: CountryList?
    var error: Error?
    var closure: (() -> Void)?
    
    func fetchCountryList(stringURL: String, completion: @escaping (CountryList?, Error?) -> Void) {
        isFetchCountryListCalled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            completion(self.countryList, self.error)
            self.closure?()
        }
    }
    
    func fetchLocalCountryList() -> CountryList? {
        return CountryList()
    }
}
