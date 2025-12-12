//
//  DateExtrasTests.swift
//  LNSSwiftUIExtrasTests
//

import XCTest
@testable import LNSSwiftUIExtras

final class DateExtrasTests: XCTestCase {

    func testToday() {
        let today = Date.today
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: today)

        XCTAssertEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)
    }

    func testYesterday() {
        let yesterday = Date.yesterday
        let today = Date.today
        let calendar = Calendar.current

        let daysBetween = calendar.dateComponents([.day], from: yesterday, to: today).day
        XCTAssertEqual(daysBetween, 1)

        let components = calendar.dateComponents([.hour, .minute, .second], from: yesterday)
        XCTAssertEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)
    }

    func testTomorrow() {
        let tomorrow = Date.tomorrow
        let today = Date.today
        let calendar = Calendar.current

        let daysBetween = calendar.dateComponents([.day], from: today, to: tomorrow).day
        XCTAssertEqual(daysBetween, 1)

        let components = calendar.dateComponents([.hour, .minute, .second], from: tomorrow)
        XCTAssertEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)
    }

    func testZeroHour() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15
        components.hour = 14
        components.minute = 30
        components.second = 45

        let testDate = calendar.date(from: components)!
        let zeroHour = testDate.zeroHour

        let zeroComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: zeroHour)
        XCTAssertEqual(zeroComponents.year, 2023)
        XCTAssertEqual(zeroComponents.month, 8)
        XCTAssertEqual(zeroComponents.day, 15)
        XCTAssertEqual(zeroComponents.hour, 0)
        XCTAssertEqual(zeroComponents.minute, 0)
        XCTAssertEqual(zeroComponents.second, 0)
    }

    func testNextDay() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15
        components.hour = 14
        components.minute = 30

        let testDate = calendar.date(from: components)!
        let nextDay = testDate.nextDay

        let nextComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: nextDay)
        XCTAssertEqual(nextComponents.year, 2023)
        XCTAssertEqual(nextComponents.month, 8)
        XCTAssertEqual(nextComponents.day, 16)
        XCTAssertEqual(nextComponents.hour, 0)
        XCTAssertEqual(nextComponents.minute, 0)
        XCTAssertEqual(nextComponents.second, 0)
    }

    func testNextDayWithOffset() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!

        let next3Days = testDate.next(day: 3)
        let next3Components = calendar.dateComponents([.year, .month, .day], from: next3Days)
        XCTAssertEqual(next3Components.year, 2023)
        XCTAssertEqual(next3Components.month, 8)
        XCTAssertEqual(next3Components.day, 18)

        let previous2Days = testDate.next(day: -2)
        let prev2Components = calendar.dateComponents([.year, .month, .day], from: previous2Days)
        XCTAssertEqual(prev2Components.year, 2023)
        XCTAssertEqual(prev2Components.month, 8)
        XCTAssertEqual(prev2Components.day, 13)
    }

    func testDaysSince1970() {
        let date = Date(timeIntervalSince1970: 86400 * 5)
        XCTAssertEqual(date.daysSince1970, 5)

        let date2 = Date(timeIntervalSince1970: 86400 * 100)
        XCTAssertEqual(date2.daysSince1970, 100)
    }

    func testWeekday() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!
        let weekday = testDate.weekday
        let expectedWeekday = calendar.component(.weekday, from: testDate)

        XCTAssertEqual(weekday, expectedWeekday)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testWeekdaySymbol() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!
        let symbol = testDate.weekdaySymbol

        XCTAssertFalse(symbol.isEmpty)
        XCTAssertEqual(symbol.count, 1)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testWeekdayName() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!
        let name = testDate.weekdayName

        XCTAssertFalse(name.isEmpty)
        XCTAssertGreaterThan(name.count, 1)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testMonthSymbol() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!
        let symbol = testDate.monthSymbol

        XCTAssertFalse(symbol.isEmpty)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testMonthName() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!
        let name = testDate.monthName

        XCTAssertFalse(name.isEmpty)
        XCTAssertGreaterThan(name.count, 1)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testDayOfMonth() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!
        let dayOfMonth = testDate.dayOfMonth

        XCTAssertEqual(dayOfMonth, 15)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testYear() {
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2023
        components.month = 8
        components.day = 15

        let testDate = calendar.date(from: components)!
        let year = testDate.year

        XCTAssertEqual(year, 2023)
    }

    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func testUsecTimestamp() {
        let timestamp = Date.usecTimestamp

        XCTAssertGreaterThan(timestamp, 0)

        let approximateSeconds = UInt64(Date().timeIntervalSince1970)
        let approximateMicroseconds = approximateSeconds * 1_000_000

        XCTAssertTrue(timestamp > approximateMicroseconds - 1_000_000, "Timestamp should be within 1 second")
        XCTAssertTrue(timestamp < approximateMicroseconds + 1_000_000, "Timestamp should be within 1 second")
    }
}
