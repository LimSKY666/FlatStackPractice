//
//  DetailsCountryRouter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation
import UIKit

protocol DetailsCountryRoutingLogic {
    func routeToImageCollection()
}

protocol DetailsCountryDataPassing {
    var dataStore: DetailsCountryDataStore? { get }
}

class DetailsCountryRouter: DetailsCountryRoutingLogic, DetailsCountryDataPassing {
    
    weak var viewController: DetailsCountryViewController?
    var dataStore: DetailsCountryDataStore?
    
    func routeToImageCollection() {
        //guard let images = dataStore?.country.countryInfo.images else { return }
        let images = ["Abs", "ab"]
        guard let imageCollectionViewController = DefaultImageCollectionAssembly().assemble(images: images) as? ImageCollectionViewController else { return }
        guard let detailsCountryViewContoller = viewController else { return }
        detailsCountryViewContoller.addChild(imageCollectionViewController)
        imageCollectionViewController.didMove(toParent: detailsCountryViewContoller)
        detailsCountryViewContoller.containerView.addSubview(imageCollectionViewController.view)
        imageCollectionViewController.configureView()
    }
}
