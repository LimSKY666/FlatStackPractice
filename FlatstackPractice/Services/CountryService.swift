//
//  JsonService.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation
import SwiftyJSON

protocol CountryService {
    
}

struct DefaultCountryService: CountryService {
    
    let listParser = DefaultListParser()
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    func fetchLocalCountryList() -> CountryList? {
        if let data = readLocalFile(forName: "page1") {
            if let json = try? JSON(data: data) {
                return listParser.parseList(json: json)
            }
        }
        return nil
    }
}
