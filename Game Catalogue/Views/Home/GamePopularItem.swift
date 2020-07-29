//
//  GamePopularItem.swift
//  Game Catalogue
//
//  Created by Wanhar on 07/07/20.
//

import SwiftUI
import URLImage

struct GamePopularItem: View {
    
    let item: Game
    
    func imageURL() -> URL {
        if let url  = item.background_image {
            return URL(string: url) ?? URL(string: IMAGE_DEFAULT)!
        } else {
            return URL(string: IMAGE_DEFAULT)!
        }
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            
            URLImage(imageURL(), placeholder: { _ in
                Indicator()
                    .frame(width: 50, height: 50)
            }) { proxy in
                proxy.image
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 170)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.name)
                    .foregroundColor(.primary)
                    .font(.headline)
                
                Text(item.slug)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
            }
            
        }
    }
}
