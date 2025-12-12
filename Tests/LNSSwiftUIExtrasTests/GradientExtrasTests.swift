//
//  GradientExtrasTests.swift
//  LNSSwiftUIExtrasTests
//

import XCTest
import SwiftUI
@testable import LNSSwiftUIExtras

final class GradientExtrasTests: XCTestCase {

    func testGradientOpacityFullOpacity() {
        let gradient = Gradient(colors: [.red, .blue])
        let opaqueGradient: Gradient = gradient.opacity(1.0)

        XCTAssertEqual(opaqueGradient.stops.count, gradient.stops.count)

        for (original, modified) in zip(gradient.stops, opaqueGradient.stops) {
            XCTAssertEqual(original.location, modified.location)

            let originalComponents = original.color.components
            let modifiedComponents = modified.color.components

            XCTAssertEqual(originalComponents.r, modifiedComponents.r, accuracy: 0.01)
            XCTAssertEqual(originalComponents.g, modifiedComponents.g, accuracy: 0.01)
            XCTAssertEqual(originalComponents.b, modifiedComponents.b, accuracy: 0.01)
            XCTAssertEqual(modifiedComponents.a, 1.0, accuracy: 0.01)
        }
    }

    func testGradientOpacityHalfOpacity() {
        let gradient = Gradient(colors: [.red, .green, .blue])
        let semiTransparent: Gradient = gradient.opacity(0.5)

        XCTAssertEqual(semiTransparent.stops.count, gradient.stops.count)

        for stop in semiTransparent.stops {
            let components = stop.color.components
            XCTAssertEqual(components.a, 0.5, accuracy: 0.01)
        }
    }

    func testGradientOpacityZeroOpacity() {
        let gradient = Gradient(colors: [.yellow, .purple])
        let transparent: Gradient = gradient.opacity(0.0)

        XCTAssertEqual(transparent.stops.count, gradient.stops.count)

        for stop in transparent.stops {
            let components = stop.color.components
            XCTAssertEqual(components.a, 0.0, accuracy: 0.01)
        }
    }

    func testGradientOpacityPreservesColors() {
        let gradient = Gradient(colors: [Color(red: 1, green: 0, blue: 0), Color(red: 0, green: 1, blue: 0), Color(red: 0, green: 0, blue: 1)])
        let modified: Gradient = gradient.opacity(0.75)

        XCTAssertEqual(modified.stops.count, 3)

        let firstComponents = modified.stops[0].color.components
        XCTAssertEqual(firstComponents.r, 1, accuracy: 0.01)
        XCTAssertEqual(firstComponents.g, 0, accuracy: 0.01)
        XCTAssertEqual(firstComponents.b, 0, accuracy: 0.01)
        XCTAssertEqual(firstComponents.a, 0.75, accuracy: 0.01)
    }

    func testGradientOpacityPreservesLocations() {
        let stops = [
            Gradient.Stop(color: .red, location: 0.0),
            Gradient.Stop(color: .green, location: 0.5),
            Gradient.Stop(color: .blue, location: 1.0)
        ]
        let gradient = Gradient(stops: stops)
        let modified: Gradient = gradient.opacity(0.8)

        XCTAssertEqual(modified.stops.count, 3)
        XCTAssertEqual(modified.stops[0].location, 0.0, accuracy: 0.01)
        XCTAssertEqual(modified.stops[1].location, 0.5, accuracy: 0.01)
        XCTAssertEqual(modified.stops[2].location, 1.0, accuracy: 0.01)
    }

    func testGradientOpacityWithExistingTransparency() {
        let semiTransparentRed = Color.red.opacity(0.5)
        let gradient = Gradient(colors: [semiTransparentRed, .blue])
        let modified: Gradient = gradient.opacity(0.5)

        let firstComponents = modified.stops[0].color.components

        XCTAssertEqual(firstComponents.a, 0.25, accuracy: 0.01)
    }

    func testGradientOpacityEmptyGradient() {
        let gradient = Gradient(stops: [])
        let modified: Gradient = gradient.opacity(0.5)

        XCTAssertEqual(modified.stops.count, 0)
    }

    func testGradientOpacitySingleStop() {
        let gradient = Gradient(colors: [.red])
        let modified: Gradient = gradient.opacity(0.3)

        XCTAssertEqual(modified.stops.count, 1)

        let components = modified.stops[0].color.components
        XCTAssertEqual(components.a, 0.3, accuracy: 0.01)
    }

    func testGradientOpacityMultipleStops() {
        let stops = [
            Gradient.Stop(color: .red, location: 0.0),
            Gradient.Stop(color: .orange, location: 0.25),
            Gradient.Stop(color: .yellow, location: 0.5),
            Gradient.Stop(color: .green, location: 0.75),
            Gradient.Stop(color: .blue, location: 1.0)
        ]
        let gradient = Gradient(stops: stops)
        let modified: Gradient = gradient.opacity(0.6)

        XCTAssertEqual(modified.stops.count, 5)

        for stop in modified.stops {
            let components = stop.color.components
            XCTAssertEqual(components.a, 0.6, accuracy: 0.01)
        }
    }
}
