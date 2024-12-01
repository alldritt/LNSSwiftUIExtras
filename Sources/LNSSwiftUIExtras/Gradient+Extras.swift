//
//  File.swift
//  LNSSwiftUIExtras
//
//  Created by Mark Alldritt on 2024-12-01.
//

import SwiftUI


public extension Gradient {
    
    func opacity(_ opacity: CGFloat) -> Gradient {
        //  Create a version of this Gradient with an opacity applied to each stop's color.
        return Gradient(stops: self.stops.map({ stop in
                .init(color: stop.color.opacity(opacity), location: stop.location)
        }))
    }

}

