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
    var countryList: CountryList?
    var countryService: CountryService?
    
    func fetchCountryList(request: FetchCountries.Request) {
        guard let countries = countryService?.fetchLocalCountryList()?.countries else { return }
        let response = FetchCountries.Response(countries: countries)
        presenter?.presentFetchedCountries(response: response)
    }
    
    func fetchBackendCountryList(request: FetchCountries.Request) {
        var stringURL: String?
        if countryList == nil {
            stringURL = Configuration.baseURL
        } else {
            stringURL = countryList?.next
        }
        if let stringURL = stringURL, !stringURL.isEmpty {
            presenter?.presentLoadingMoreState()
            countryService?.fetchCountryList(stringURL: stringURL, completion: { [weak self]
                countryList, error in
                if let countryList = countryList {
                    self?.countryList = countryList
                } else if let error = error {
                    print(error.localizedDescription)
                }
                let response = FetchCountries.Response(countries: self?.countryList?.countries ?? [])
                self?.presenter?.presentFetchedCountries(response: response)
            })
        }
    }
}
