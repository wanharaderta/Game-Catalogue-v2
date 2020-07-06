//
//  HomeView.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Popular in 2019")
                .font(.custom("Arial", size: 30))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            ScrollView(.horizontal,showsIndicators:false){
                HStack() {
                    
                }
            }
        }
    }
}

struct GameCell:View {
    
    var body: some View {
        VStack(alignment:.leading) {
            
            ZStack {
                Image(systemName: "house")
                    .resizable().frame(width: UIScreen.main.bounds.width - 30, height: 200)
                
                Text("test")
                    .font(.system(size: 12, weight: .heavy))
            }
            
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
