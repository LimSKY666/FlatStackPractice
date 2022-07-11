//
//  Assembley.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 30.06.2022.
//

import Foundation
import UIKit

protocol CountryListModuleAssembly {
    func assemble() -> UIViewController
}

struct DefaultCountryListAssembly: CountryListModuleAssembly {
    func assemble() -> UIViewController {
        let countryInfoParser = DefaultCountryInfoParser()
        let countryParser = DefaultCountryParser(countryInfoParser: countryInfoParser)
        let countryListParser = DefaultListParser(countryParser: countryParser)
        let countryService = DefaultCountryService(listParser: countryListParser)
        let viewController = CountryListViewController()
        let interactor = CountryListInteractor()
        let presenter = CountryListPresenter()
        let router = CountryListRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.countryListViewController = viewController
        interactor.presenter = presenter
        interactor.countryService = countryService
        router.viewController = viewController
        router.dataStore = interactor
        return viewController
    }
}
