//
//  ImageCollectionPresenter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 12.07.2022.
//

import Foundation

protocol ImageCollectionPresentationLogic {
    func presentImages(response: ImageCollectionModels.Response)
}

class ImageCollectionPresenter: ImageCollectionPresentationLogic {
    
    weak var imageCollectionViewController: ImageCollectionDisplayLogic?
    
    func presentImages(response: ImageCollectionModels.Response) {
        let images = response.images
        let viewModel = ImageCollectionModels.ViewModel(images: images)
        imageCollectionViewController?.displayImages(viewModel: viewModel)
    }
}
