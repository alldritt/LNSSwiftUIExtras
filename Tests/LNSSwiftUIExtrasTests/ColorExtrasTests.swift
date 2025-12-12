//
//  ColorExtrasTests.swift
//  LNSSwiftUIExtrasTests
//

import XCTest
import SwiftUI
@testable import LNSSwiftUIExtras

final class ColorExtrasTests: XCTestCase {

    func testContrastingBlackOrWhiteForDarkColor() {
        let darkColor = Color.black
        let contrast = darkColor.contrastingBlackOrWhite

        XCTAssertEqual(contrast, .white)
    }

    func testContrastingBlackOrWhiteForLightColor() {
        let lightColor = Color.white
        let contrast = lightColor.contrastingBlackOrWhite

        XCTAssertEqual(contrast, .black)
    }

    func testContrastingBlackOrWhiteForMidToneColor() {
        let yellowColor = Color(red: 1, green: 1, blue: 0)
        let contrast = yellowColor.contrastingBlackOrWhite

        XCTAssertEqual(contrast, .black)
    }

    func testComponentsForBlack() {
        let black = Color.black
        let components = black.components

        XCTAssertEqual(components.r, 0, accuracy: 0.01)
        XCTAssertEqual(components.g, 0, accuracy: 0.01)
        XCTAssertEqual(components.b, 0, accuracy: 0.01)
        XCTAssertEqual(components.a, 1, accuracy: 0.01)
    }

    func testComponentsForWhite() {
        let white = Color.white
        let components = white.components

        XCTAssertEqual(components.r, 1, accuracy: 0.01)
        XCTAssertEqual(components.g, 1, accuracy: 0.01)
        XCTAssertEqual(components.b, 1, accuracy: 0.01)
        XCTAssertEqual(components.a, 1, accuracy: 0.01)
    }

    func testComponentsForRed() {
        let red = Color(red: 1, green: 0, blue: 0)
        let components = red.components

        XCTAssertEqual(components.r, 1, accuracy: 0.01)
        XCTAssertEqual(components.g, 0, accuracy: 0.01)
        XCTAssertEqual(components.b, 0, accuracy: 0.01)
        XCTAssertEqual(components.a, 1, accuracy: 0.01)
    }

    func testComponentsForGreen() {
        let green = Color(red: 0, green: 1, blue: 0)
        let components = green.components

        XCTAssertEqual(components.r, 0, accuracy: 0.01)
        XCTAssertGreaterThan(components.g, 0.9)
        XCTAssertEqual(components.b, 0, accuracy: 0.01)
        XCTAssertEqual(components.a, 1, accuracy: 0.01)
    }

    func testComponentsForBlue() {
        let blue = Color(red: 0, green: 0, blue: 1)
        let components = blue.components

        XCTAssertEqual(components.r, 0, accuracy: 0.01)
        XCTAssertEqual(components.g, 0, accuracy: 0.01)
        XCTAssertEqual(components.b, 1, accuracy: 0.01)
        XCTAssertEqual(components.a, 1, accuracy: 0.01)
    }

    func testComponentsForCustomColor() {
        let custom = Color(red: 0.5, green: 0.25, blue: 0.75)
        let components = custom.components

        XCTAssertEqual(components.r, 0.5, accuracy: 0.01)
        XCTAssertEqual(components.g, 0.25, accuracy: 0.01)
        XCTAssertEqual(components.b, 0.75, accuracy: 0.01)
        XCTAssertEqual(components.a, 1, accuracy: 0.01)
    }

    func testComponentsForTransparentColor() {
        let transparent = Color(red: 1, green: 0, blue: 0).opacity(0.5)
        let components = transparent.components

        XCTAssertEqual(components.r, 1, accuracy: 0.01)
        XCTAssertEqual(components.g, 0, accuracy: 0.01)
        XCTAssertEqual(components.b, 0, accuracy: 0.01)
        XCTAssertEqual(components.a, 0.5, accuracy: 0.01)
    }

    func testInterpolateAtStart() {
        let fromColor = Color(red: 1, green: 0, blue: 0)
        let toColor = Color(red: 0, green: 0, blue: 1)
        let result = fromColor.interpolate(to: toColor, with: 0.0)
        let components = result.components

        XCTAssertEqual(components.r, 1, accuracy: 0.01)
        XCTAssertEqual(components.g, 0, accuracy: 0.01)
        XCTAssertEqual(components.b, 0, accuracy: 0.01)
    }

    func testInterpolateAtEnd() {
        let fromColor = Color(red: 1, green: 0, blue: 0)
        let toColor = Color(red: 0, green: 0, blue: 1)
        let result = fromColor.interpolate(to: toColor, with: 1.0)
        let components = result.components

        XCTAssertEqual(components.r, 0, accuracy: 0.01)
        XCTAssertEqual(components.g, 0, accuracy: 0.01)
        XCTAssertEqual(components.b, 1, accuracy: 0.01)
    }

    func testInterpolateAtMidpoint() {
        let fromColor = Color(red: 1, green: 0, blue: 0)
        let toColor = Color(red: 0, green: 0, blue: 1)
        let result = fromColor.interpolate(to: toColor, with: 0.5)
        let components = result.components

        XCTAssertEqual(components.r, 0.5, accuracy: 0.01)
        XCTAssertEqual(components.g, 0, accuracy: 0.01)
        XCTAssertEqual(components.b, 0.5, accuracy: 0.01)
    }

    func testInterpolateWithOpacity() {
        let fromColor = Color(red: 1, green: 0, blue: 0).opacity(0.0)
        let toColor = Color(red: 0, green: 0, blue: 1).opacity(1.0)
        let result = fromColor.interpolate(to: toColor, with: 0.5)
        let components = result.components

        XCTAssertEqual(components.a, 0.5, accuracy: 0.01)
    }

    func testInterpolateBlackToWhite() {
        let fromColor = Color.black
        let toColor = Color.white
        let result = fromColor.interpolate(to: toColor, with: 0.25)
        let components = result.components

        XCTAssertEqual(components.r, 0.25, accuracy: 0.01)
        XCTAssertEqual(components.g, 0.25, accuracy: 0.01)
        XCTAssertEqual(components.b, 0.25, accuracy: 0.01)
    }

    func testInterpolateCustomColors() {
        let fromColor = Color(red: 0.2, green: 0.4, blue: 0.6)
        let toColor = Color(red: 0.8, green: 0.6, blue: 0.2)
        let result = fromColor.interpolate(to: toColor, with: 0.5)
        let components = result.components

        XCTAssertEqual(components.r, 0.5, accuracy: 0.01)
        XCTAssertEqual(components.g, 0.5, accuracy: 0.01)
        XCTAssertEqual(components.b, 0.4, accuracy: 0.01)
    }

    func testSystemBackgroundColorExists() {
        let backgroundColor = Color.systemBackground
        XCTAssertNotNil(backgroundColor)
    }

    func testSecondarySystemBackgroundColorExists() {
        let backgroundColor = Color.secondarySystemBackground
        XCTAssertNotNil(backgroundColor)
    }

    func testTertiarySystemBackgroundColorExists() {
        let backgroundColor = Color.tertiarySystemBackground
        XCTAssertNotNil(backgroundColor)
    }

    #if !os(macOS)
    func testLightTextColorExists() {
        let textColor = Color.lightText
        XCTAssertNotNil(textColor)
    }

    func testDarkTextColorExists() {
        let textColor = Color.darkText
        XCTAssertNotNil(textColor)
    }
    #endif
}
