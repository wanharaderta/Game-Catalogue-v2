//
//  GameMenu.swift
//  Game Catalogue
//
//  Created by Wanhar on 20/07/20.
//

import Foundation

struct GameMenu {
    let id = UUID()
    let name: String
}

extension GameMenu {
    static func all() ->[GameMenu] {
        return [
            GameMenu(name: "Game Info"),
            GameMenu(name: "Screenshots"),
            GameMenu(name: "Platforms"),
            GameMenu(name: "Stores")
        ]
    }
}
