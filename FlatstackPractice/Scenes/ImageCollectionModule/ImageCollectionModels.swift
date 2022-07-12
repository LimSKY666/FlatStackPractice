//
//  ImageCollectionModels.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 12.07.2022.
//

import Foundation

enum ImageCollectionModels {
    
    struct Request {
    }
    
    struct Response {
      var images: [String]
    }
    
    struct ViewModel {
        var images: [String]
    }
}
