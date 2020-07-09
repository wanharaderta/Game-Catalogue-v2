//
//  SearchView.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import SwiftUI


struct SearchView: View {
    
    @ObservedObject private var viewModel = SearchViewModel()
  
    
    var body: some View {
        NavigationView {
            List {
                TextField("Search", text: self.$viewModel.searchTemp, onEditingChanged: {_ in } ){
                    self.viewModel.search()
                }.textFieldStyle(RoundedBorderTextFieldStyle())

                ForEach(self.viewModel.gameList, id: \.id){ game in
                    NavigationLink(destination: DetailView(item: game)){
                        SearchItem(item: game)
                    }
                }
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            .navigationTitle("Search")
        }
       
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
