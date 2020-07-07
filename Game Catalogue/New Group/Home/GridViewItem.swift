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
        
        
    var body: some View {
        VStack {
            
            if self.columns.count == 2 {
                URLImage(URL(string: item.background_image)!) { proxy in
                    proxy.image
                        .resizable()
                        .renderingMode(.original)
                        .frame(height: 250)
                        .cornerRadius(10)
                }
                
                Text(item.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .lineLimit(1)
            } else {
                URLImage(URL(string: item.background_image)!) { proxy in
                    proxy.image
                        .resizable()
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .frame(width: 250, height: 250)
                }
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(item.name)
                            .foregroundColor(.primary)
                            .font(.headline)
                        
                        Spacer()
                    }
                    
                    Text(item.slug)
                        .font(.headline)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .frame(height: 30)
                }.padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

