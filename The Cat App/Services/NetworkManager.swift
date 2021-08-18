//
//  NetworkManager.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 06.08.2021.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let api = "https://api.thecatapi.com/v1/images/search?limit=20&api_key=b2d727d2-01e9-43be-ad52-62d6556f44f6"

    private init() {}
    
    func fetchData(completion: @escaping (_ cats: [Cat]) -> Void) {
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let cats = try JSONDecoder().decode([Cat].self, from: data)
                DispatchQueue.main.async {
                    completion(cats)
                    print(cats)
                }
            } catch let error {
                print("Error serialization json", error)
            }
        }.resume()
    }
    
}
