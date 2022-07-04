//
//  CountryListPresenter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation

protocol CountryListPresentationLogic {
    func presentFetchedCountries(response: FetchCountries.Response)
}

class CountryListPresenter: CountryListPresentationLogic {
    
    weak var countryListViewController: CountryListDisplayLogic?
    
    func presentFetchedCountries(response: FetchCountries.Response) {
        var displayedCountries: [FetchCountries.ViewModel.DisplayedCountries] = []
        for country in response.countries {
            let displayedCountry = FetchCountries.ViewModel.DisplayedCountries(name: country.name, capital: country.capital, description: country.descriptionSmall, flag: country.countryInfo.flag)
            displayedCountries.append(displayedCountry)
        }
        let viewModel = FetchCountries.ViewModel(displayedCountries: displayedCountries)
        countryListViewController?.displayFetchedCountries(viewModel: viewModel)
    }
}
