//
//  JsonService.swift
//  FlatstackPractice
//
//  Created by Семён Соколов on 29.06.2022.
//

import Foundation
import SwiftyJSON

protocol CountryService {
    func fetchLocalCountryList() -> CountryList?
    func fetchCountryList(stringURL: String, completion: @escaping (CountryList?, Error?) -> Void)
}

struct DefaultCountryService: CountryService {
    
    let listParser: ListParser
    private let configuration = URLSessionConfiguration.default
    
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
    
    func fetchCountryList(stringURL: String, completion: @escaping (CountryList?, Error?) -> Void) {
        if let url = URL(string: stringURL) {
            let session = URLSession(configuration: self.configuration)
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData)
            request.httpMethod = "GET"
            session.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(nil, error)
                } else if let data = data, let json = try? JSON(data: data) {
                    completion(listParser.parseList(json: json), nil)
                }
            }.resume()
        }
    }
}
