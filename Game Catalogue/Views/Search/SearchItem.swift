//
//  SearchItem.swift
//  Game Catalogue
//
//  Created by Wanhar on 08/07/20.
//

import SwiftUI
import URLImage

struct SearchItem: View {
    
    let item: Game
    
    var body: some View {
        VStack {
            HStack {
                
                URLImage((URL(string: item.background_image ?? NO_IMAGE)!), placeholder: { _ in
                    Indicator()
                        .frame(width: 50, height: 50)
                }) { proxy in
                    proxy.image
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                VStack(alignment:.leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.released)
                        .font(.subheadline)
                        .foregroundColor(Color.gray).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    Text("Rank \(item.rating_top)")
                        .font(.subheadline)
                        .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
            }
            
        }
    }
}
