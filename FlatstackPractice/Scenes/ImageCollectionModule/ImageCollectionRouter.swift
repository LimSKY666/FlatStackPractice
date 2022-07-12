//
//  ImageCollectionRouter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 12.07.2022.
//

import Foundation

protocol ImageCollectionRoutingLogic {
    
}

protocol ImageCollectionDataPassing {
    var dataStore: ImageCollectionDataStore? { get }
}

class ImageCollectionRouter: ImageCollectionRoutingLogic, ImageCollectionDataPassing {
    
    weak var viewController: ImageCollectionViewController?
    var dataStore: ImageCollectionDataStore?
}
