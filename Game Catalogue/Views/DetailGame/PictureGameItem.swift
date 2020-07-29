//
//  PictureGameItem.swift
//  Game Catalogue
//
//  Created by Wanhar on 20/07/20.
//

import SwiftUI
import URLImage

struct PictureGameItem: View {
    
    let imageURL:String?
    
    func image() -> URL {
        if let url  = imageURL {
            return URL(string: url) ?? URL(string: IMAGE_DEFAULT)!
        } else {
            return URL(string: IMAGE_DEFAULT)!
        }
    }
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            URLImage(image(), placeholder: { _ in
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
                
                
            }
        }
    }
}

struct PictureGameItem_Previews: PreviewProvider {
    static var previews: some View {
        PictureGameItem(imageURL: IMAGE_DEFAULT)
    }
}
