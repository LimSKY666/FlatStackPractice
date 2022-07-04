//
//  CountryListInteractor.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation

protocol CountryListBusinessLogic {
    func fetchCountryList(request: FetchCountries.Request)
}

class CountryListInteractor: CountryListBusinessLogic {
    
    var presenter: CountryListPresentationLogic?
    var countries: [Country]?
    var countryService = DefaultCountryService()
    
    func fetchCountryList(request: FetchCountries.Request) {
        self.countries = countryService.fetchLocalCountryList()?.countries
        let response = FetchCountries.Response(countries: countries!)
        self.presenter?.presentFetchedCountries(response: response)
    }
}
