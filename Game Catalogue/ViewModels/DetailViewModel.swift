//
//  DetailViewModel.swift
//  Game Catalogue
//
//  Created by Wanhar on 21/07/20.
//

import Foundation
import CoreData


class DetailViewModel: ObservableObject {
    
    private var service : WebService!
    private let store = PersistentStore.shared.context
    
    @Published var gameDetail : GameDetailResponse = DETAIL_GAME_RESPONSE
    @Published var isFavorite = false
    
    init() {
        self.service = WebService()
    }
    
    func saveGame(id: Int, name: String, image: String, ranking: Int, rating: Double, released: String){
        let fv      = Games(context: store)
        fv.id       = Int16(id)
        fv.name     = name
        fv.rating   = rating
        fv.ranking  = Int16(ranking)
        fv.background_image = image
        fv.released = released
        
        do {
            try self.store.save()
            isFavorite = true
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func getDetail(id:Int){
        self.service.getDetailGame(id: id) { result in
            if let data = result as GameDetailResponse? {
                DispatchQueue.main.async {
                    self.gameDetail = data
                }
            }
        }
    }
    
    func checkFavorite(id:Int) {
        var results    = [Games]()
        
        let request: NSFetchRequest<Games>    = Games.fetchRequest()
        request.predicate    = NSPredicate(format: "id == \(id)")
        
        do {
            results = try self.store.fetch(request)
            if results.count > 0 {
                isFavorite = true
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func fetchGame(id:Int) -> Games? {
        var results    = [Games]()
        
        let request: NSFetchRequest<Games>    = Games.fetchRequest()
        request.predicate    = NSPredicate(format: "id == \(id)")
        
        do {
            results = try self.store.fetch(request)
        } catch let error as NSError {
            print(error)
        }
        
        return results.first
    }
    
    func deleteGame(id:Int){
        do {
            if let game = fetchGame(id: id){
                self.store.delete(game)
                try self.store.save()
                isFavorite = false
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
}
