//
//  Typography.swift
//  BeyableExampleApplicationiOS
//
//  Created by MarKinho on 30/07/2024.
//
import SwiftUI

enum Typography {
    case body(FontSize, weight: FontWeight)
    case title(FontSize, weight: FontWeight)

    enum FontSize: CGFloat {
        case xs = 12
        case s = 14
        case m = 16
        case l = 18
    }

    enum FontWeight: String {
        case regular
        case bold
    }

    var uiFont: UIFont {
        switch self {
        case .body(let size, let weight), .title(let size, let weight):
            let fontWeight: UIFont.Weight
            switch weight {
            case .regular:
                fontWeight = .regular
            case .bold:
                fontWeight = .bold
            }
            return UIFont.systemFont(ofSize: size.rawValue, weight: fontWeight)
        }
    }
}
