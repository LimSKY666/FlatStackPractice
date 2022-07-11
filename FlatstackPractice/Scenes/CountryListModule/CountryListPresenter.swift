//
//  CountryListPresenter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation
import UIKit

protocol CountryListPresentationLogic {
    func presentFetchedCountries(response: CountryListModels.Response)
    func presentLoadingMoreState()
}

class CountryListPresenter: CountryListPresentationLogic {
    
    weak var countryListViewController: CountryListDisplayLogic?
    
    func presentFetchedCountries(response: CountryListModels.Response) {
        var displayedCountries: [CountryListModels.ViewModel.DisplayedCountries] = []
        for country in response.countries {
            let displayedCountry = CountryListModels.ViewModel.DisplayedCountries(name: country.name, capital: country.capital, description: country.descriptionSmall, flag: country.countryInfo.flag)
            displayedCountries.append(displayedCountry)
        }
        let viewModel = CountryListModels.ViewModel(displayedCountries: displayedCountries)
        countryListViewController?.displayFetchedCountries(viewModel: viewModel)
        countryListViewController?.hideFooter()
    }
    
    func presentLoadingMoreState() {
        countryListViewController?.displayTableFooterView()
    }
}
