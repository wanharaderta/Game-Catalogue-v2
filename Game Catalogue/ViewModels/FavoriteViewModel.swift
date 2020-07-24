//
//  FavoriteViewModel.swift
//  Game Catalogue
//
//  Created by Wanhar on 22/07/20.
//

import Foundation
import CoreData

class FavoriteViewModel: ObservableObject {
    
    let store = PersistentStore.shared.context
    
    @Published var gameFavorites : [GameFavorite] = [GameFavorite]()
    
    func getAllFavorites() {
        gameFavorites = []
        var results   = [Games]()
        let fetchRequest : NSFetchRequest<Games>  = Games.fetchRequest()
        
        do {
            results  = try self.store.fetch(fetchRequest)
            for result in results{
                let game = GameFavorite(id: result.value(forKeyPath: "id") as? Int,
                                        name: result.value(forKeyPath: "name") as? String,
                                        background_image: result.value(forKeyPath: "background_image") as? String,
                                        ranking: result.value(forKeyPath: "ranking") as? Int,
                                        rating: result.value(forKeyPath: "rating") as? Double,
                                        released: result.value(forKeyPath: "released") as? String)
                gameFavorites.append(game)
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
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
                getAllFavorites()
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
}
