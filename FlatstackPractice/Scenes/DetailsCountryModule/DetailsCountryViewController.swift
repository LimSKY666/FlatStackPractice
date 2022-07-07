//
//  DetailsCountryViewController.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 07.07.2022.
//

import Foundation
import UIKit

protocol DetailsCountryDisplayLogic: AnyObject {

}

class DetailsCountryViewController: UIViewController, DetailsCountryDisplayLogic {
    
    var interactor: DetailsCountryBusinessLogic?
    var router: (DetailsCountryRoutingLogic & DetailsCountryDataPassing)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = UIView()
        view.backgroundColor = .white
    }
    
}
