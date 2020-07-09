//
//  Extension.swift
//  Game Catalogue
//
//  Created by Wanhar on 09/07/20.
//

import Foundation
import SwiftUI


extension View {
    func inExpandingRectangle() -> some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
            self
        }
    }
}

extension Double {
    func toInt() -> Int? {
        if self >= Double(Int.min) && self < Double(Int.max) {
            return Int(self)
        } else {
            return nil
        }
    }
}

