//
//  DetailViewModel.swift
//  Game Catalogue
//
//  Created by Wanhar on 21/07/20.
//

import Foundation
import SwiftUI

class DetailViewModel: ObservableObject {
    
    let store = PersistentStore.shared.context
    @Published var isFavorite = false
    

    
    func saveTodo(id: Int, name: String, image: String, ranking: Int, rating:Double){
        let fv      = Games(context: store)
        fv.id       = Int16(id)
        fv.name     = name
        fv.rating   = rating
        fv.ranking  = Int16(ranking)
        fv.background_image = image

        do {
            try self.store.save()
        } catch let error as NSError {
            print(error)
        }
    }
}
