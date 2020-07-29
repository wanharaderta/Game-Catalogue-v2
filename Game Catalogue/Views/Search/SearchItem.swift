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
    
    func imageURL() -> URL {
        if let url  = item.background_image {
            return URL(string: url) ?? URL(string: IMAGE_DEFAULT)!
        } else {
            return URL(string: IMAGE_DEFAULT)!
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                
                URLImage(imageURL(), placeholder: { _ in
                    ZStack {
                        Indicator()
                    }.frame(width: 100, height: 90)
                    .cornerRadius(10)
                    .clipped()
                }) { proxy in
                    proxy.image
                        .resizable()
                        .clipped()
                        .cornerRadius(10)
                        .frame(width: 100, height: 90)
                }
                VStack(alignment:.leading) {
                    Text(item.name)
                        .font(.headline)
                    if (item.released != nil){
                        Text(item.released ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    }
                    Text("Rank \(item.rating_top)")
                        .font(.subheadline)
                        .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
            }
            
        }
    }
}
