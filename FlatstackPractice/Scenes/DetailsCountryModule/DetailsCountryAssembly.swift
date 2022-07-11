//
//  Assembly.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation
import UIKit

protocol DetailsModuleAssembly {
    func assemble(country: Country) -> UIViewController
}

struct DefaultDetailsCountryAssembly: DetailsModuleAssembly {
    
    func assemble(country: Country) -> UIViewController {
        let viewController = DetailsCountryViewController()
        let interactor = DetailsCountryInteractor()
        let presenter = DetailsCountryPresenter()
        let router = DetailsCountryRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.detailsCountryViewController = viewController
        interactor.presenter = presenter
        interactor.country = country
        router.dataStore = interactor
        router.viewController = viewController
        return viewController
    }
    
}
