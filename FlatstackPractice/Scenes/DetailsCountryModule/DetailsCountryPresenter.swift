//
//  DetailsCountryPresenter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation
import UIKit

protocol DetailsCountryPresentationLogic {
    func presentCountry(response: DetailsCountryModels.Response)
}

class DetailsCountryPresenter: DetailsCountryPresentationLogic {

    weak var detailsCountryViewController: DetailsCountryDisplayLogic?
    
    func presentCountry(response: DetailsCountryModels.Response) {
        let country = response.country
        let displayedCountry = DetailsCountryModels.ViewModel.DisplayedCountry(name: country.name, capital: country.capital, population: country.population, continent: country.continent, description: country.description)
        let viewModel = DetailsCountryModels.ViewModel(displayedCountry: displayedCountry)
        detailsCountryViewController?.displayCountry(viewModel: viewModel)
    }
}
