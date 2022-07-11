//
//  DetailsCountryModels.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 09.07.2022.
//

import Foundation

enum DetailsCountryModels {
    
    struct Request {
    }
    
    struct Response {
      var country: Country
    }
    
    struct ViewModel {
        var name: String
        var capital: String
        var population: Int
        var continent: String
        var description: String
    }
}
