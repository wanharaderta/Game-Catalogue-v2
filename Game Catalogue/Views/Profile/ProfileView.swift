//
//  ProfileView.swift
//  Game Catalogue
//
//  Created by Wanhar on 09/07/20.
//

import SwiftUI
import URLImage

struct ProfileView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                HStack {
                    Spacer()
                    URLImage(URL(string: PHOTO)!) { proxy in
                        proxy.image
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            .clipped()
                            .cornerRadius(150)
                            .shadow(radius: 10)
                    }
                    Spacer()
                }
                
                Text("Wanhar")
                    .bold()
                    .font(.title)
                    .padding()
                Text("Wanhardaengmaro@gmail.com")
                    .bold()
                    .font(.subheadline)
                    
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            
            .navigationBarTitle("Profile")
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
