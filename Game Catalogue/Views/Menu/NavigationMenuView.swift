//
//  NavigationMenuView.swift
//  Game Catalogue
//
//  Created by Wanhar on 06/07/20.
//

import SwiftUI

struct NavigationMenuView: View {
    
    @Binding var index: Int
    
    var body: some View {
        HStack {
            Button(action: {
                self.index = 0
            }){
                Image(systemName: "house")
            }.foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))
            .frame(width: 40, height: 40)
            
            Spacer(minLength:0)
            
            Button(action: {
                self.index = 1
            }){
                Image(systemName: "magnifyingglass")
            }.foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            .frame(width: 40, height: 40)
            
            Spacer(minLength:0)
            
            Button(action: {
                self.index = 2
            }){
                Image(systemName: "person")
            }.foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.2))
            .frame(width: 40, height: 40)
            
            Spacer(minLength:0)
            
            Button(action: {
                self.index = 3
            }){
                Image(systemName: "info.circle")
            }.foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))
            .frame(width: 40, height: 40)
            
        }.padding(.horizontal, 35)
        .padding([.top,.bottom],10)
        
    }
}

struct NavigationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationMenuView(index: .constant(0))
    }
}
