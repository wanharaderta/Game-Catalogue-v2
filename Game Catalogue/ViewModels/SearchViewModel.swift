//
//  SearchViewModel.swift
//  Game Catalogue
//
//  Created by Wanhar on 08/07/20.
//

import Foundation

class SearchViewModel: ObservableObject {
    
    private var service : WebService!
    
    @Published var gameList : [Game] = [Game]()
    @Published var emptyList = false
    
    var searchTemp: String = ""
    
    init() {
        self.service = WebService()
        search()
    }
    
    func search() {
        if let item = self.searchTemp.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed){
            searchGames(item: item)
        }
    }
    
    private func searchGames(item:String){
        self.service.searchGames(searchItem: item) { result in
            if let data = result as Results? {
                DispatchQueue.main.async {
                    self.gameList = data.games
                    if self.gameList.count == 0 {
                        self.emptyList = true
                    }
                }
            }
        }
    }
}
