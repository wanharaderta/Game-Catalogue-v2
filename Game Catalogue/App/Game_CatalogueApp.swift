//
//  Game_CatalogueApp.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import SwiftUI
import CoreData

@main
struct Game_CatalogueApp: App {
    
    @StateObject private var persistentStore = PersistentStore.shared
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentStore.context)
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("background")
                savePersistentStore()
            @unknown default:
                fatalError("\(#function), fatal error in switch statement for .onChange modifier")
            }
        }
    }
    
    func savePersistentStore() {
        persistentStore.saveContext()
    }
}
