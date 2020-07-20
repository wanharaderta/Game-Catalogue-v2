//
//  HomeView.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import SwiftUI
import URLImage


struct HomeView: View {
    
    @ObservedObject private var viewModel = HomeViewModel()
    @State private var columns = Array(repeating: GridItem(.flexible(),spacing: 15), count: 2)
    
    init(){
        viewModel.load()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView(.vertical,showsIndicators:false){
                    
                    LazyVStack(alignment: .leading, spacing: 0) {
                        Text("Popular in 2019")
                            .font(.title)
                            .padding()
                        if (self.viewModel.gamePopulars.count == 0) {
                            HStack {
                                Spacer()
                                Indicator()
                                Spacer()
                            }
                        } else {
                            ScrollView(.horizontal,showsIndicators:false){
                                HStack(alignment:.top) {
                                    ForEach(self.viewModel.gamePopulars, id: \.id){ game in
                                        NavigationLink(destination: DetailView(item: game)){
                                            GamePopularItem(item: game)
                                                .padding(5)
                                        }
                                    }
                                }.padding([.leading,.trailing],18)
                            }
                        }
                        
                        HStack {
                            Text("All Games")
                                .font(.title)
                                .padding([.bottom],10)
                            
                            Spacer()
                            
                            Button(action: {
                                if self.columns.count == 2 {
                                    self.columns.removeLast()
                                } else {
                                    self.columns.append(GridItem(.flexible(),spacing: 15))
                                }
                            }, label: {
                                Image(systemName: self.columns.count == 2 ? "rectangle.grid.1x2" : "square.grid.2x2")
                                    .font(.system(size: 24))
                                    .foregroundColor(.black)
                            }).padding()
                            
                        }.padding([.horizontal,.top])
                        
                        if (self.viewModel.games.count == 0){
                            HStack(alignment:.center) {
                                Spacer()
                                Indicator()
                                Spacer()
                            }
                        } else {
                            LazyVGrid(columns: self.columns, spacing: 25) {
                                ForEach(self.viewModel.games, id: \.id) { game in
                                    NavigationLink(destination: DetailView(item: game)){
                                        GridViewItem(item: game, columns: self.$columns)
                                    }
                                }
                            }.padding([.horizontal,.top])
                        }
                        
                    }
                }
            }
            
            .navigationTitle("Home")
        }
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
