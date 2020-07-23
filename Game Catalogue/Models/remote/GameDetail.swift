//
//  GameDetail.swift
//  Game Catalogue
//
//  Created by Wanhar on 22/07/20.
//

import Foundation


struct GameDetailResponse: Codable {
    
    let id: Int
    let name: String
    let description_raw: String
    let rating: Double?
    let background_image: String?
    let released: String?
    let website: String?
    let rating_top: Int
    let genres:[Genres]?
    let tags:[Tags]?
    let developers:[Developer]?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description_raw
        case rating
        case background_image
        case released
        case website
        case rating_top
        case genres = "genres"
        case tags   = "tags"
        case developers   = "developers"
    }
}

struct Genres: Codable {
    let id: Int
    let name: String
}

struct Tags: Codable {
    let id: Int
    let name: String
}

struct Developer: Codable {
    let id: Int
    let name: String
    let image_background: String
}
