//
//  Date+Extras.swift
//  DayView
//
//  Created by Mark Alldritt on 2023-08-07.
//

import SwiftUI


public extension Color {
    var contrastingBlackOrWhite: Color {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        UIColor(self).getRed(&r, green: &g, blue: &b, alpha: &a)
        let luminance = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  luminance < 0.6 ? .white : .black
    }
    
    var components: (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {
        if let components = self.cgColor?.components {
            switch components.count {
            case 2:
                return (r: components[0], g: components[0], b: components[0], a: components[1])
                
            default:
                return (r: components[0], g: components[1], b: components[2], a: components[3])
            }
        }
        else {
            return (r: 0, g: 0, b: 0, a: 0)
        }
    }

    func interpolate(to toColor: Color, with progress: CGFloat) -> Color {
        let fromComponents = self.components
        let toComponents = toColor.components

        let r = (1 - progress) * fromComponents.r + progress * toComponents.r
        let g = (1 - progress) * fromComponents.g + progress * toComponents.g
        let b = (1 - progress) * fromComponents.b + progress * toComponents.b
        let a = (1 - progress) * fromComponents.a + progress * toComponents.a

        return Color(red: r, green: g, blue: b).opacity(a)
    }
}


public extension Color {
    #if os(watchOS)
    static let lightText = Color.primary
    static let darkText = Color.secondary
    static let systemBackground = Color.clear
    static let secondarySystemBackground = Color(.sRGB, white: 0.07, opacity: 1.0)
    static let tertiarySystemBackground = Color(.sRGB, white: 0, opacity: 1.0)
    #else
    static let lightText = Color(UIColor.lightText)
    static let darkText = Color(UIColor.darkText)
    static let systemBackground = Color(UIColor.systemBackground)
    static let secondarySystemBackground = Color(UIColor.secondarySystemBackground)
    static let tertiarySystemBackground = Color(UIColor.tertiarySystemBackground)
    #endif
}
