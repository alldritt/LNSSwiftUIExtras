//
//  ViewModifiers.swift
//  LNSSwiftUIExtras
//
//  Created by Mark Alldritt on 2023-07-26.
//

import SwiftUI


//
//	Obtain the initial frame of a view.
//
//	Usage:
//
//	@State var viewFrame: CGRect = .zero
//
//	...
//
//	var body: some View {
//		MyView()
//			.saveFrame($viewFrame)
//	}
//
//
//	Using an alternate coordinate space:
//
//	@State var viewFrame: CGRect = .zero
//
//	...
//
//	var body: some View {
//		MyView()
//			.saveFrame($viewFrame, coordinateSpace: .named("MySpace"))
//	}
//

public struct FrameCalculator: ViewModifier {

    @Binding public var frame: CGRect
    public let coordinateSpace: CoordinateSpace

    public func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear // we just want the reader to get triggered, so let's use an empty color
                        .onAppear {
                            frame = proxy.frame(in: .global)
                        }
                }
            )
    }
}

extension View {
    public func saveFrame(in frame: Binding<CGRect>, coordinateSpace: CoordinateSpace = .global
) -> some View {
        modifier(FrameCalculator(frame: frame, coordinateSpace: coordinateSpace))
    }
}


//
//	Conditional view modifier
//
//	var body: some View {
//		MyView()
//			.if(condition) {
//				$0..overlay(Circle().foregroundColor(.red))
//		}
//	}
//
//	

extension View {
    @ViewBuilder public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
