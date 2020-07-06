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
        
//        VStack(spacing:0) {
//
//            ZStack {
//                if self.index == 0 {
//                    HomeView()
//                } else if self.index == 1 {
//                    SearchView()
//                } else {
//                   // ContentView()
//                }
//            }
//
//            NavigationMenuView(index: self.$index)
//                .background(Color.white)
//        }.background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
        
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
                        Text("Developer")
                    }
                }.tag(3)
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "info.circle")
                        Text("About")
                    }
                }.tag(3)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

