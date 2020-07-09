//
//  HomeViewModel.swift
//  Game Catalogue
//
//  Created by Wanhar on 07/07/20.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    private var service : WebService!
    
    @Published var gamePopulars : [Game] = [Game]()
    @Published var games : [Game] = [Game]()
    
    init() {
        self.service = WebService()
    }
    
    func load() {
        fetchGamePopular()
        fetchAllGames()
    }
    
    private func fetchGamePopular(){
        self.service.getGamesPopular{ result in
            if let data = result as Results? {
                DispatchQueue.main.async {
                    self.gamePopulars = data.games
                }
            }
        }
    }
    
    private func fetchAllGames(){
        self.service.getAllGames{ result in
            if let data = result as Results? {
                DispatchQueue.main.async {
                    self.games = data.games
                }
            }
        }
    }
}
