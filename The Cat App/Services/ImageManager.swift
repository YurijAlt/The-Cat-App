//
//  ImageManager.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 07.08.2021.
//

import Foundation

class ImageManager {
    
    static var shared = ImageManager()
    private init() {}
    
    func fetchImage(from url: String, completion: @escaping(Data) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No description")
                return
            }
            DispatchQueue.main.async {
                completion(data)
            }
        }.resume()
    }
    
    func fetchImageData(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil }
        return imageData
    }
    
    
}

