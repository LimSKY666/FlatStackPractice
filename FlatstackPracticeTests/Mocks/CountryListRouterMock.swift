//
//  CountryListRouterMock.swift
//  FlatstackPracticeTests
//
//  Created by Семён Соколов on 11.07.2022.
//

import Foundation
@testable import FlatstackPractice

class CountryListRouterMock: CountryListRoutingLogic {
    
    private(set) var isRouteToDetailsCountryCalled = false
    
    func routeToDetailsCountry(index: Int) {
        isRouteToDetailsCountryCalled = true
    }
}
