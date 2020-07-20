//
//  CustomShape.swift
//  Game Catalogue
//
//  Created by Wanhar on 20/07/20.
//

import SwiftUI

struct CustomShape : Shape {
    
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        return Path(path.cgPath)
    }
}
