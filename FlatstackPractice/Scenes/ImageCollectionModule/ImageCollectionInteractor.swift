//
//  ImageCollectionInteractor.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 12.07.2022.
//

import Foundation

protocol ImageCollectionBusinessLogic {
    func getImages(request: ImageCollectionModels.Request)
}

protocol ImageCollectionDataStore {
    var images: [String]! { get }
}

class ImageCollectionInteractor: ImageCollectionBusinessLogic, ImageCollectionDataStore {
        
    var presenter: ImageCollectionPresentationLogic?
    var images: [String]!
    
    func getImages(request: ImageCollectionModels.Request) {
        let response = ImageCollectionModels.Response(images: images)
        presenter?.presentImages(response: response)
    }
}
