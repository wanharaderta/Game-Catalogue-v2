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
                
                if (item.background_image != nil) {
                    URLImage(URL(string: item.background_image!)!) { proxy in
                        proxy.image
                            .resizable()
                            .renderingMode(.original)
                            .frame(height: 180)
                            .cornerRadius(10)
                    }
                }
                
                
                Text(item.name)
                    .foregroundColor(.primary)
                    .font(.headline)
            } else {
                if (item.background_image != nil) {
                    URLImage(URL(string: item.background_image!)!) { proxy in
                        proxy.image
                            .resizable()
                            .renderingMode(.original)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .frame(width: 350, height: 230)
                    }

                }

                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(item.name)
                            .foregroundColor(.primary)
                            .font(.headline)

                        Spacer()
                    }

                    Text(item.slug)
                        .font(.subheadline)
                        .foregroundColor(.secondary).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }.padding(.top, /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

