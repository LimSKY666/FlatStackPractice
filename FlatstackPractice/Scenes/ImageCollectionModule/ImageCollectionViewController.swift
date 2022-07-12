//
//  ImageCollectionViewController.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 12.07.2022.
//

import Foundation
import UIKit

protocol ImageCollectionDisplayLogic: AnyObject {
    func displayImages(viewModel: ImageCollectionModels.ViewModel)
}

class ImageCollectionViewController: UIViewController, ImageCollectionDisplayLogic {

    var interactor: ImageCollectionBusinessLogic?
    var router: (ImageCollectionRoutingLogic & ImageCollectionDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        let view = UIView()
        self.view = view
    }
    
    func displayImages(viewModel: ImageCollectionModels.ViewModel) {
        
    }
    
    func configureView() {
        view.backgroundColor = .green
        view.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
