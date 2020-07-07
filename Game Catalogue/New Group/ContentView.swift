//
//  ContentView.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
        
        NavigationView {
            
            TabView {
                
                HomeView()
                    .tabItem {
                        VStack {
                            Image(systemName: "house")
                            Text("Home")
                        }
                    }.tag(1)
                
                SearchView()
                    .tabItem {
                        VStack {
                            Image(systemName: "magnifyingglass")
                            Text("Search")
                        }
                    }.tag(2)
                
                SearchView()
                    .tabItem {
                        VStack {
                            Image(systemName: "person")
                            Text("Profile")
                        }
                    }.tag(3)
            }
            
            .navigationTitle("Game Catalogue")
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

