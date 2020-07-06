//
//  WebServices.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import Foundation

class WebServices {
    
    let BASE_URL : String = "https://api.rawg.io/api/"
    
    func getGamesPopular(completion: @escaping (([Game?]) -> Void)) {
        guard let url   = URL(string: "\(BASE_URL)games?dates=2019-01-01,2019-01-01&ordering=-added&page_size=5") else {
            fatalError("URL is not correct")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, let data = data else { return }
            
            if response.statusCode == 200 {
                let decoder = JSONDecoder()
                let games = try! decoder.decode([Game].self, from: data)
                DispatchQueue.main.async {
                    completion(games)
                }
            } else {
                print("ERROR: \(data), HTTP Status: \(response.statusCode)")
            }
        }.resume()
        
    }
}

