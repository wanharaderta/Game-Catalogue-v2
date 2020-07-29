//
//  FavoriteView.swift
//  Game Catalogue
//
//  Created by Wanhar on 21/07/20.
//

import SwiftUI
import SwiftUIRefresh

struct FavoriteView: View {
    
    @ObservedObject private var viewModel = FavoriteViewModel()
    @State private var isShowing = false
    
    init() {
        self.viewModel.getAllFavorites()
    }
    
    private func delete(at offsets:IndexSet){
        offsets.forEach { index in
            let game = self.viewModel.gameFavorites[index]
            self.viewModel.deleteGame(id: game.id!)
        }
    }
    
    var body: some View {
        
        NavigationView {
            List {
                if viewModel.gameFavorites.count == 0 {
                    VStack(alignment:.center) {
                        HStack{
                            Spacer()
                            Image("circle_heart")
                                .resizable()
                                .frame(width: 200, height: 200)
                            Spacer()
                        }.padding(.top, 100)
                        
                        Text("No favorites yet!")
                            .font(.title)
                            .bold()
                    }
                } else {
                    ForEach(self.viewModel.gameFavorites, id: \.id){ game in
                        if game.id != nil {
                            NavigationLink(destination: DetailView(id: game.id!)){
                                FavoriteItem(item: game)
                            }
                        }
                    }.onDelete(perform: delete)
                }
            }.pullToRefresh(isShowing: $isShowing) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.viewModel.getAllFavorites()
                    self.isShowing = false
                }
            }
            .navigationTitle("Favorite")
        }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
