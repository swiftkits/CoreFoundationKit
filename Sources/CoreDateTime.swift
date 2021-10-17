//
//  CoreDateTime.swift
//  CoreFoundationKit
//
//  Created by Manish on 17/10/21.
//

import Foundation

public struct CoreDateTime: DateTimeProvider {
    public var day: Int
    public var month: Int
    public var year: Int
    
    public var hour: Int
    public var minute: Int
    public var second: Int
    
    public var timezone: TimeZone
    public var locale: Locale
    public var calendar: Calendar
    
    public init(day: Int = 1, month: Int = 1, year: Int = 1970,
                hour: Int = 0, minute: Int = 0, second: Int = 0,
                timezone: TimeZone = .current,
                locale: Locale = .current,
                calendar: Calendar = .current) {
        self.day = day
        self.month = month
        self.year = year
        
        self.hour = hour
        self.minute = minute
        self.second = second
        
        self.timezone = timezone
        self.locale = locale
        self.calendar = calendar
    }
}
