//
//  URLExtrasTests.swift
//  LNSSwiftUIExtrasTests
//

import XCTest
@testable import LNSSwiftUIExtras

final class URLExtrasTests: XCTestCase {

    func testTemporaryURLWithoutName() {
        let tempURL = URL.temporaryURL()

        XCTAssertTrue(tempURL.isFileURL)

        let tempDir = FileManager.default.temporaryDirectory
        XCTAssertTrue(tempURL.path.hasPrefix(tempDir.path))

        XCTAssertTrue(tempURL.lastPathComponent.hasSuffix(".tmp"))
    }

    func testTemporaryURLWithName() {
        let customName = "test-file.txt"
        let tempURL = URL.temporaryURL(name: customName)

        XCTAssertTrue(tempURL.isFileURL)

        let tempDir = FileManager.default.temporaryDirectory
        XCTAssertTrue(tempURL.path.hasPrefix(tempDir.path))

        XCTAssertEqual(tempURL.lastPathComponent, customName)
    }

    func testTemporaryURLUniqueness() {
        let tempURL1 = URL.temporaryURL()
        let tempURL2 = URL.temporaryURL()

        XCTAssertNotEqual(tempURL1, tempURL2)
    }

    func testTemporaryURLWithDifferentNames() {
        let tempURL1 = URL.temporaryURL(name: "file1.txt")
        let tempURL2 = URL.temporaryURL(name: "file2.txt")

        XCTAssertNotEqual(tempURL1, tempURL2)
        XCTAssertEqual(tempURL1.lastPathComponent, "file1.txt")
        XCTAssertEqual(tempURL2.lastPathComponent, "file2.txt")
    }

    func testTemporaryURLWithSameName() {
        let customName = "same-file.txt"
        let tempURL1 = URL.temporaryURL(name: customName)
        let tempURL2 = URL.temporaryURL(name: customName)

        XCTAssertEqual(tempURL1.lastPathComponent, customName)
        XCTAssertEqual(tempURL2.lastPathComponent, customName)
        XCTAssertEqual(tempURL1, tempURL2)
    }
}
