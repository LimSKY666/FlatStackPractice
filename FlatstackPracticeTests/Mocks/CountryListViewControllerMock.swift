//
//  CountryListViewControllerMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice

class CountryListViewControllerMock: CountryListDisplayLogic {
    
    private(set) var isDisplayFetchedCountriesCalled = false
    private(set) var isHideFooterCalled = false
    private(set) var isDisplayTableFooterViewCalled = false
    private(set) var viewModel: CountryListModels.ViewModel!
        
    func displayFetchedCountries(viewModel: CountryListModels.ViewModel) {
        self.viewModel = viewModel
        isDisplayFetchedCountriesCalled = true
    }
    
    func hideFooter() {
        isHideFooterCalled = true
    }
    
    func displayTableFooterView() {
        isDisplayTableFooterViewCalled = true
    }
    
}
