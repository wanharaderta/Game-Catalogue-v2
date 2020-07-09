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
                
                if (item.background_image != nil) {
                    URLImage(URL(string: item.background_image!)!) { proxy in
                        proxy.image
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
                VStack(alignment:.leading) {
                    Text(item.name)
                        .font(.headline)
                    Text(item.slug)
                        .font(.subheadline)
                        .foregroundColor(Color.gray).opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                }
            }
            
        }
    }
}
