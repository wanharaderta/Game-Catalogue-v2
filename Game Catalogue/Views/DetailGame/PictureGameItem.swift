//
//  PictureGameItem.swift
//  Game Catalogue
//
//  Created by Wanhar on 20/07/20.
//

import SwiftUI
import URLImage

struct PictureGameItem: View {
    
    let imageURL:String
    
    var body: some View {
        VStack(alignment:.leading, spacing: 10) {
            URLImage((URL(string: imageURL )!), placeholder: { _ in
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
