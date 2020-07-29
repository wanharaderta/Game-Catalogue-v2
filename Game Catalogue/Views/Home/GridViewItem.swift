//
//  GridViewItem.swift
//  Game Catalogue
//
//  Created by Wanhar on 07/07/20.
//

import SwiftUI
import URLImage


struct GridViewItem: View {
    
    let item: Game
    @Binding var columns: [GridItem]
    
    func imageURL() -> URL {
        if let url  = item.background_image {
            return URL(string: url) ?? URL(string: IMAGE_DEFAULT)!
        } else {
            return URL(string: IMAGE_DEFAULT)!
        }
    }
    
    var body: some View {
        VStack {
            if self.columns.count == 2 {
                URLImage(imageURL(), placeholder: { _ in
                    Indicator()
                        .frame(width: 50, height: 50)
                }) { proxy in
                    proxy.image
                        .resizable()
                        .renderingMode(.original)
                        .frame(height: 180)
                        .cornerRadius(10)
                }
                Text(item.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                    .lineLimit(1)
            } else {
                URLImage(imageURL(), placeholder: { _ in
                    Indicator()
                        .frame(width: 50, height: 50)
                }) { proxy in
                    proxy.image
                        .resizable()
                        .renderingMode(.original)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .frame(width: UIScreen.main.bounds.width - 30, height: 220)
                }
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text(item.name)
                            .foregroundColor(.primary)
                            .font(.headline)
                        
                        Spacer()
                    }
                    if (item.released != nil){
                        Text(item.released ?? "")
                            .font(.subheadline)
                            .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    }
                    Text("Rank \(item.rating_top)")
                        .font(.subheadline)
                        .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }.padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .frame(width: UIScreen.main.bounds.width - 30)
            }
        }
    }
}

