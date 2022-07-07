//
//  CountryListRouter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation

protocol CountryListRoutingLogic {
    func routeToDetailsCountry(index: Int)
}

protocol CountryListDataPassing
{
  var dataStore: CountryListDataStore? { get }
}

class CountryListRouter: CountryListRoutingLogic, CountryListDataPassing {
    
    var dataStore: CountryListDataStore?
    weak var viewController: CountryListViewController?
    
    func routeToDetailsCountry(index: Int) {
        guard let country = dataStore?.countryList?.countries[index] else { return }
        let detailsCountryViewController = DefaultDetailsCountryAssembly().assemble(country: country)
        guard let countryListViewController = viewController else { return }
        countryListViewController.navigationController?.pushViewController(detailsCountryViewController, animated: true)
    }

}
