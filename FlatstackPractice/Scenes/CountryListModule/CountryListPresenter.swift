//
//  CountryListPresenter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation
import UIKit

protocol CountryListPresentationLogic {
    func presentFetchedCountries(response: CountryListModel.Response)
    func presentLoadingMoreState()
}

class CountryListPresenter: CountryListPresentationLogic {
    
    weak var countryListViewController: CountryListDisplayLogic?
    
    func presentFetchedCountries(response: CountryListModel.Response) {
        var displayedCountries: [CountryListModel.ViewModel.DisplayedCountries] = []
        for country in response.countries {
            let displayedCountry = CountryListModel.ViewModel.DisplayedCountries(name: country.name, capital: country.capital, description: country.descriptionSmall, flag: country.countryInfo.flag)
            displayedCountries.append(displayedCountry)
        }
        let viewModel = CountryListModel.ViewModel(displayedCountries: displayedCountries)
        countryListViewController?.displayFetchedCountries(viewModel: viewModel)
        countryListViewController?.hideFooter()
    }
    
    func presentLoadingMoreState() {
        countryListViewController?.displayTableFooterView()
    }
}
