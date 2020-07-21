//
//  GameFavorite.swift
//  Game Catalogue
//
//  Created by Wanhar on 21/07/20.
//

import Foundation


struct GameFavorite: Codable {
    var id = UUID()
    var name: String
    var background_image: String
    var ranking: Int
    var rating: Double
}
