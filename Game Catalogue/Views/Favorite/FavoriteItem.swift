//
//  FavoriteItem.swift
//  Game Catalogue
//
//  Created by Wanhar on 22/07/20.
//

import SwiftUI
import URLImage

struct FavoriteItem: View {
    
    let item : GameFavorite
    
    var body: some View {
        VStack {
            HStack {
                
                URLImage((URL(string: item.background_image ?? IMAGE_DEFAULT)!), placeholder: { _ in
                    Indicator()
                        .frame(width: 50, height: 50)
                }) { proxy in
                    proxy.image
                        .resizable()
                        .clipped()
                        .cornerRadius(10)
                        .frame(width: 100, height: 90)
                }
                VStack(alignment:.leading) {
                    Text(item.name ?? "")
                        .font(.headline)
                    if (item.released != nil){
                        Text(item.released ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    }
                    Text("Rank \(item.ranking ?? 0)")
                        .font(.subheadline)
                        .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
            }
            
        }
    }
}
