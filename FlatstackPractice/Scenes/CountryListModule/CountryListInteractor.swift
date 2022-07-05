//
//  CountryListInteractor.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation

protocol CountryListBusinessLogic {
    func fetchCountryList(request: FetchCountries.Request)
    func fetchBackendCountryList(request: FetchCountries.Request)
}

class CountryListInteractor: CountryListBusinessLogic {
    
    var presenter: CountryListPresentationLogic?
    var countries: [Country] = []
    var countryService: CountryService?

    func fetchCountryList(request: FetchCountries.Request) {
        guard let countries = countryService?.fetchLocalCountryList()?.countries else { return }
        let response = FetchCountries.Response(countries: countries)
        presenter?.presentFetchedCountries(response: response)
    }
    
    func fetchBackendCountryList(request: FetchCountries.Request) {
        countryService?.fetchCountryList(stringURL: Configuration.baseURL, completion: { [weak self] countryList, error in
            if let countryList = countryList {
                self?.countries = countryList.countries
                
            } else if let error = error {
                print(error.localizedDescription)
            }
            let response = FetchCountries.Response(countries: self?.countries ?? [])
            self?.presenter?.presentFetchedCountries(response: response)
        })
    }
}
