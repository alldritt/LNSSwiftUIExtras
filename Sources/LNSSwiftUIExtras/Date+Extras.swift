//
//  Date+Extras.swift
//  DayView
//
//  Created by Mark Alldritt on 2023-08-07.
//

import Foundation


public extension Date {
    
    static var today : Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.day, .month, .year, .hour, .minute, .second], from: Date())
        
        components.hour = 0
        components.minute = 0
        components.second = 0

        let today = calendar.date(from: components)
        
        return today!
    }
    
    static var yesterday : Date {
        let calendar = Calendar.current
        let yesterday = calendar.date(byAdding: .day, value: -1, to: today)
        
        return yesterday!
    }

    static var tomorrow : Date {
        let calendar = Calendar.current
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)
        
        return tomorrow!
    }

    var zeroHour : Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.day, .month, .year, .hour, .minute, .second], from: self)
        
        components.hour = 0
        components.minute = 0
        components.second = 0
        
        return calendar.date(from: components)!
    }
    
    var nextDay : Date {
        let calendar = Calendar.current
        
        return calendar.date(byAdding: .day, value: 1, to: zeroHour)!
    }

    func next(day: Int) -> Date {
        let calendar = Calendar.current
        
        return calendar.date(byAdding: .day, value: day, to: zeroHour)!
    }

    var daysSince1970: Int {
        let secondsPerDay = TimeInterval(86400)
        
        return Int(timeIntervalSince1970 / secondsPerDay)
    }
    
    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }
    
    var weekdaySymbol: String {
        formatted(Date.FormatStyle().weekday(.narrow))
    }

    var weekdayName: String {
        formatted(Date.FormatStyle().weekday(.wide))
    }

    var monthSymbol: String {
        formatted(Date.FormatStyle().month(.narrow))
    }

    var monthName: String {
        formatted(Date.FormatStyle().month(.wide))
    }

    var dayOfMonth: Int {
        Calendar.current.component(.day, from: self)
    }

    var year: Int {
        Calendar.current.component(.year, from: self)
    }

    static var usecTimestamp : UInt64 {
        return UInt64(Date().timeIntervalSince1970 * Double(USEC_PER_SEC) /* convert to Microseconds */)
    }

}

