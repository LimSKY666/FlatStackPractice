//
//  Assembley.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 30.06.2022.
//

import Foundation
import UIKit

protocol Assembly {
    func assemble() -> UIViewController
}

struct DefaultAssembly: Assembly {

    func assemble() -> UIViewController {
        let viewController = CountryListViewController()
        let interactor = CountryListInteractor()
        let presenter = CountryListPresenter()
        let router = CountryListRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.countryListViewController = viewController
        interactor.presenter = presenter
        return viewController
    }
}
