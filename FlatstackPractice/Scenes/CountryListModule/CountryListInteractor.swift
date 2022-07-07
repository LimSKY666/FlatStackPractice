//
//  CountryListInteractor.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation

protocol CountryListBusinessLogic {
    func fetchCountryList(request: CountryListModel.FetchCountries.Request)
    func fetchBackendCountryList(request: CountryListModel.FetchCountries.Request)
    func refreshCountryList(request: CountryListModel.RefreshCountries.Request)
}

protocol CountryListDataStore
{
  var countryList: CountryList? { get }
}

class CountryListInteractor: CountryListBusinessLogic, CountryListDataStore {
    
    var presenter: CountryListPresentationLogic?
    var countryList: CountryList?
    var countryService: CountryService?
    
    func fetchCountryList(request: CountryListModel.FetchCountries.Request) {
        guard let countries = countryService?.fetchLocalCountryList()?.countries else { return }
        let response = CountryListModel.Response(countries: countries)
        presenter?.presentFetchedCountries(response: response)
    }
    
    func fetchBackendCountryList(request: CountryListModel.FetchCountries.Request) {
        var stringURL: String?
        if countryList == nil {
            stringURL = Configuration.baseURL
        } else {
            stringURL = countryList?.next
        }
        if let stringURL = stringURL, !stringURL.isEmpty {
            presenter?.presentLoadingMoreState()
            fetchCountries(stringURL: stringURL, completion: { [weak self] recievedCountryList in
                guard let self = self else { return }
                guard let recievedCountryList = recievedCountryList else { return }
                if var countryList = self.countryList {
                    countryList.countries.append(contentsOf: recievedCountryList.countries)
                    countryList.next = recievedCountryList.next
                    self.countryList = countryList
                } else {
                    self.countryList = recievedCountryList
                }
                let response = CountryListModel.Response(countries: self.countryList?.countries ?? [])
                self.presenter?.presentFetchedCountries(response: response)
            })
        }
    }
    
    func refreshCountryList(request: CountryListModel.RefreshCountries.Request) {
        fetchCountries(stringURL: Configuration.baseURL, completion: { [weak self] countryList in
            guard let self = self else { return }
            self.countryList?.countries = countryList?.countries ?? []
            let response = CountryListModel.Response(countries: self.countryList?.countries ?? [])
            self.presenter?.presentFetchedCountries(response: response)
        })
    }
    
    private func fetchCountries(stringURL: String, completion: @escaping (CountryList?) -> Void) {
        countryService?.fetchCountryList(stringURL: stringURL, completion: {
            countryList, error in
            if let countryList = countryList {
                completion(countryList)
            } else if let error = error {
                print(error)
            }
        })
    }
    
}
                                            
                                             
                
