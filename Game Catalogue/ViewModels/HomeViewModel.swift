//
//  HomeViewModel.swift
//  Game Catalogue
//
//  Created by Wanhar on 07/07/20.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var gamePopulars : [Game] = [Game]()
    @Published var games : [Game] = [Game]()
    
    func load() {
        fetchGamePopular()
        fetchAllGames()
    }
    
    private func fetchGamePopular(){
        WebService().getGamesPopular{ result in
            if let data = result as Results? {
                DispatchQueue.main.async {
                    self.gamePopulars = data.games
                }
            }
        }
    }
    
    private func fetchAllGames(){
        WebService().getAllGames{ result in
            if let data = result as Results? {
                DispatchQueue.main.async {
                    self.games = data.games
                }
            }
        }
    }
}
