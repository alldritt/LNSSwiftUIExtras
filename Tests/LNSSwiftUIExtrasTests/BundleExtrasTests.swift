//
//  BundleExtrasTests.swift
//  LNSSwiftUIExtrasTests
//

import XCTest
@testable import LNSSwiftUIExtras

final class BundleExtrasTests: XCTestCase {

    func testApplicationNameNotNil() {
        let bundle = Bundle.main
        let appName = bundle.applicationName

        XCTAssertNotNil(appName)
    }

    func testApplicationNameFallback() {
        let testBundle = Bundle(for: type(of: self))
        let appName = testBundle.applicationName

        let displayName = testBundle.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        let bundleName = testBundle.object(forInfoDictionaryKey: "CFBundleName") as? String

        if let displayName = displayName {
            XCTAssertEqual(appName, displayName)
        } else if let bundleName = bundleName {
            XCTAssertEqual(appName, bundleName)
        }
    }

    func testApplicationNamePrioritizesDisplayName() {
        let bundle = Bundle.main

        let displayName = bundle.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
        let bundleName = bundle.object(forInfoDictionaryKey: "CFBundleName") as? String

        if displayName != nil {
            XCTAssertEqual(bundle.applicationName, displayName)
        } else {
            XCTAssertEqual(bundle.applicationName, bundleName)
        }
    }
}
