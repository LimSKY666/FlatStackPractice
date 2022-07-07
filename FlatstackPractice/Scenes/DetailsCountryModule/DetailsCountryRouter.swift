//
//  DetailsCountryRouter.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation
import UIKit

protocol DetailsCountryRoutingLogic {
    
}

protocol DetailsCountryDataPassing {
    var dataStore: DetailsCountryDataStore? { get }
}

class DetailsCountryRouter: DetailsCountryRoutingLogic, DetailsCountryDataPassing {
    
    weak var viewController: DetailsCountryViewController?
    var dataStore: DetailsCountryDataStore?
}
