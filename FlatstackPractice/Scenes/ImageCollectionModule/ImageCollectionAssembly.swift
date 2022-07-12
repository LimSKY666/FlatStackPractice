//
//  ImageCollectionAssembly.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 12.07.2022.
//

import Foundation

import Foundation
import UIKit

protocol ImageCollectionAssembly {
    func assemble(images: [String]) -> UIViewController
}

struct DefaultImageCollectionAssembly: ImageCollectionAssembly {
    
    func assemble(images: [String]) -> UIViewController {
        let viewController = ImageCollectionViewController()
        let interactor = ImageCollectionInteractor()
        let presenter = ImageCollectionPresenter()
        let router = ImageCollectionRouter()
        viewController.interactor = interactor
        viewController.router = router
        presenter.imageCollectionViewController = viewController
        interactor.presenter = presenter
        router.dataStore = interactor
        router.viewController = viewController
        return viewController
    }
}
