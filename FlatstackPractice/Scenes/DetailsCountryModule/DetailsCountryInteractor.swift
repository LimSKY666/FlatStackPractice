//
//  DetailsCountryInteractor.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation

protocol DetailsCountryBusinessLogic {
    func getCountry(request: DetailsCountryModels.Request)
}

protocol DetailsCountryDataStore {
    var country: Country! { get set }
}

class DetailsCountryInteractor: DetailsCountryBusinessLogic, DetailsCountryDataStore {
    
    var presenter: DetailsCountryPresentationLogic?
    var country: Country!
    
    func getCountry(request: DetailsCountryModels.Request) {
        let response = DetailsCountryModels.Response(country: country)
        presenter?.presentCountry(response: response)
    }
}
