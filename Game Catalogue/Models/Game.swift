//
//  Games.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import Foundation

struct Results: Codable {
    
    let games:[Game]
    
    enum CodingKeys: String, CodingKey {
        case games  = "results"
    }
}


struct Game: Codable {
    
    let id: Int
    let name: String
    let slug: String
    let rating: Double?
    let background_image: String?
    let released: String?
    let rating_top: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case rating
        case background_image
        case released
        case rating_top
    }
    
}
