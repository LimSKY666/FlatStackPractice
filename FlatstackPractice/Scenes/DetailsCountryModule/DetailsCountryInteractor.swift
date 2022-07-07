//
//  DetailsCountryInteractor.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation

protocol DetailsCountryBusinessLogic {
    
}

protocol DetailsCountryDataStore {
    var country: Country! { get set }
}

class DetailsCountryInteractor: DetailsCountryBusinessLogic, DetailsCountryDataStore {
    
    var presenter: DetailsCountryPresentationLogic?
    var country: Country!
}
