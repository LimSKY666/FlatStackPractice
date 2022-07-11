//
//  CountryListModels.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 04.07.2022.
//

import Foundation

enum CountryListModels {
    
    enum FetchCountries {
        
        struct Request {
            
        }
        
    }
    
    enum RefreshCountries {
        
        struct Request {
            
        }
    }
    
    struct Response {
        var countries: [Country]
    }
    
    struct ViewModel {
        
        struct DisplayedCountries
        {
            var name: String
            var capital: String
            var description: String
            var flag: String
        }
        var displayedCountries: [DisplayedCountries]
    }
}
