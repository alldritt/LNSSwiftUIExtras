//
//  ArrayExtrasTests.swift
//  LNSSwiftUIExtrasTests
//

import XCTest
@testable import LNSSwiftUIExtras

final class ArrayExtrasTests: XCTestCase {

    struct TestModel: Codable, Equatable {
        let id: Int
        let name: String
    }

    func testArrayRawRepresentableEncode() {
        let array = [
            TestModel(id: 1, name: "First"),
            TestModel(id: 2, name: "Second"),
            TestModel(id: 3, name: "Third")
        ]

        let rawValue = array.rawValue

        XCTAssertFalse(rawValue.isEmpty)
        XCTAssertTrue(rawValue.contains("First"))
        XCTAssertTrue(rawValue.contains("Second"))
        XCTAssertTrue(rawValue.contains("Third"))
    }

    func testArrayRawRepresentableDecode() {
        let jsonString = """
        [{"id":1,"name":"First"},{"id":2,"name":"Second"}]
        """

        let array = [TestModel].init(rawValue: jsonString)

        XCTAssertNotNil(array)
        XCTAssertEqual(array?.count, 2)
        XCTAssertEqual(array?[0].id, 1)
        XCTAssertEqual(array?[0].name, "First")
        XCTAssertEqual(array?[1].id, 2)
        XCTAssertEqual(array?[1].name, "Second")
    }

    func testArrayRawRepresentableRoundTrip() {
        let originalArray = [
            TestModel(id: 1, name: "Test1"),
            TestModel(id: 2, name: "Test2")
        ]

        let rawValue = originalArray.rawValue
        let decodedArray = [TestModel].init(rawValue: rawValue)

        XCTAssertNotNil(decodedArray)
        XCTAssertEqual(decodedArray, originalArray)
    }

    func testArrayRawRepresentableEmptyArray() {
        let emptyArray: [TestModel] = []
        let rawValue = emptyArray.rawValue

        XCTAssertEqual(rawValue, "[]")

        let decodedArray = [TestModel].init(rawValue: rawValue)
        XCTAssertNotNil(decodedArray)
        XCTAssertEqual(decodedArray?.count, 0)
    }

    func testArrayRawRepresentableInvalidJSON() {
        let invalidJSON = "not valid json"
        let array = [TestModel].init(rawValue: invalidJSON)

        XCTAssertNil(array)
    }

    func testArrayRawRepresentableIntArray() {
        let intArray = [1, 2, 3, 4, 5]
        let rawValue = intArray.rawValue

        XCTAssertFalse(rawValue.isEmpty)

        let decodedArray = [Int].init(rawValue: rawValue)
        XCTAssertNotNil(decodedArray)
        XCTAssertEqual(decodedArray, intArray)
    }

    func testArrayRawRepresentableStringArray() {
        let stringArray = ["Hello", "World", "Test"]
        let rawValue = stringArray.rawValue

        XCTAssertFalse(rawValue.isEmpty)

        let decodedArray = [String].init(rawValue: rawValue)
        XCTAssertNotNil(decodedArray)
        XCTAssertEqual(decodedArray, stringArray)
    }

    func testDictionaryRawRepresentableEncode() {
        let dictionary: [String: Int] = [
            "first": 1,
            "second": 2,
            "third": 3
        ]

        let rawValue = dictionary.rawValue

        XCTAssertFalse(rawValue.isEmpty)
        XCTAssertTrue(rawValue.contains("first"))
        XCTAssertTrue(rawValue.contains("second"))
        XCTAssertTrue(rawValue.contains("third"))
    }

    func testDictionaryRawRepresentableDecode() {
        let jsonString = """
        {"first":1,"second":2}
        """

        let dictionary = [String: Int].init(rawValue: jsonString)

        XCTAssertNotNil(dictionary)
        XCTAssertEqual(dictionary?.count, 2)
        XCTAssertEqual(dictionary?["first"], 1)
        XCTAssertEqual(dictionary?["second"], 2)
    }

    func testDictionaryRawRepresentableRoundTrip() {
        let originalDict: [String: TestModel] = [
            "key1": TestModel(id: 1, name: "First"),
            "key2": TestModel(id: 2, name: "Second")
        ]

        let rawValue = originalDict.rawValue
        let decodedDict = [String: TestModel].init(rawValue: rawValue)

        XCTAssertNotNil(decodedDict)
        XCTAssertEqual(decodedDict, originalDict)
    }

    func testDictionaryRawRepresentableEmptyDictionary() {
        let emptyDict: [String: Int] = [:]
        let rawValue = emptyDict.rawValue

        XCTAssertEqual(rawValue, "{}")

        let decodedDict = [String: Int].init(rawValue: rawValue)
        XCTAssertNotNil(decodedDict)
        XCTAssertEqual(decodedDict?.count, 0)
    }

    func testDictionaryRawRepresentableInvalidJSON() {
        let invalidJSON = "not valid json"
        let dictionary = [String: Int].init(rawValue: invalidJSON)

        XCTAssertNil(dictionary)
    }

    func testDictionaryRawRepresentableNestedStructure() {
        let nestedDict: [String: [TestModel]] = [
            "group1": [TestModel(id: 1, name: "A"), TestModel(id: 2, name: "B")],
            "group2": [TestModel(id: 3, name: "C")]
        ]

        let rawValue = nestedDict.rawValue
        let decodedDict = [String: [TestModel]].init(rawValue: rawValue)

        XCTAssertNotNil(decodedDict)
        XCTAssertEqual(decodedDict, nestedDict)
    }
}
