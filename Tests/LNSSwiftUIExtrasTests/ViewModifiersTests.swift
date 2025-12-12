//
//  ViewModifiersTests.swift
//  LNSSwiftUIExtrasTests
//

import XCTest
import SwiftUI
@testable import LNSSwiftUIExtras

final class ViewModifiersTests: XCTestCase {

    func testFrameCalculatorModifierExists() {
        let binding = Binding<CGRect>(
            get: { .zero },
            set: { _ in }
        )

        let modifier = FrameCalculator(frame: binding, coordinateSpace: .global)
        XCTAssertNotNil(modifier)
    }

    func testSaveFrameModifierCompiles() {
        struct TestView: View {
            @State private var frame: CGRect = .zero

            var body: some View {
                Text("Test")
                    .saveFrame(in: $frame)
            }
        }

        let view = TestView()
        XCTAssertNotNil(view)
    }

    func testSaveFrameWithCoordinateSpaceCompiles() {
        struct TestView: View {
            @State private var frame: CGRect = .zero

            var body: some View {
                Text("Test")
                    .saveFrame(in: $frame, coordinateSpace: .named("custom"))
            }
        }

        let view = TestView()
        XCTAssertNotNil(view)
    }

    func testConditionalModifierWhenTrue() {
        struct TestView: View {
            var body: some View {
                Text("Test")
                    .if(true) { view in
                        view.foregroundColor(.red)
                    }
            }
        }

        let view = TestView()
        XCTAssertNotNil(view)
    }

    func testConditionalModifierWhenFalse() {
        struct TestView: View {
            var body: some View {
                Text("Test")
                    .if(false) { view in
                        view.foregroundColor(.red)
                    }
            }
        }

        let view = TestView()
        XCTAssertNotNil(view)
    }

    func testConditionalModifierWithMultipleModifiers() {
        struct TestView: View {
            var body: some View {
                Text("Test")
                    .if(true) { view in
                        view
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.blue)
                    }
            }
        }

        let view = TestView()
        XCTAssertNotNil(view)
    }

    func testConditionalModifierWithStateChange() {
        struct TestView: View {
            @State private var condition = false

            var body: some View {
                Text("Test")
                    .if(condition) { view in
                        view.foregroundColor(.red)
                    }
            }
        }

        let view = TestView()
        XCTAssertNotNil(view)
    }
}
