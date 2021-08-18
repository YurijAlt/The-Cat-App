//
//  DataManager.swift
//  The Cat App
//
//  Created by Юрий Чекалюк on 06.08.2021.
//

struct DataManager {
    static var shared = DataManager()
    
    let api = "https://api.thecatapi.com/v1/images/search?limit=20&api_key=b2d727d2-01e9-43be-ad52-62d6556f44f6"
    
    private init() {}
}
