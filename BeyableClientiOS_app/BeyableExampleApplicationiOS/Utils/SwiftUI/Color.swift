//
//  Color.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//
import SwiftUI

extension Color {
    static let grey5        = Color("grey5")
    static let grey6        = Color("grey6")
    static let grey10       = Color("grey10")
    static let red          = Color("red")
    static let primaryDark  = Color("black")
    
    var uiColor: UIColor {
        UIColor(self)
    }
}
