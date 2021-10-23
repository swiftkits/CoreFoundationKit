//
//  TestDateTimeProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 17/10/21.
//

import Foundation
@testable import CoreFoundationKit
import XCTest

class TestDateTimeProvider: XCTestCase {
    
    private var sut: DateTimeProvider!
    
    override func tearDownWithError() throws {
        self.sut = nil
        
        try super.tearDownWithError()
    }
    
}

extension TestDateTimeProvider {
    
    func test_createEmptyDateTime() {
        self.sut = CoreDateTime()
        
        XCTAssertEqual(sut.day, 1)
        XCTAssertEqual(sut.month, 1)
        XCTAssertEqual(sut.year, 1970)
        
        XCTAssertEqual(sut.hour, 0)
        XCTAssertEqual(sut.minute, 0)
        XCTAssertEqual(sut.second, 0)
        
        XCTAssertEqual(sut.timezone, .current)
        XCTAssertEqual(sut.locale, .current)
        XCTAssertEqual(sut.calendar, .current)
    }
    
    func test_createCustomDateTime() {
        self.sut = CoreDateTime(day: 12, month: 2, year: 2020,
                                hour: 1, minute: 35, second: 45)
        
        XCTAssertEqual(sut.day, 12)
        XCTAssertEqual(sut.month, 2)
        XCTAssertEqual(sut.year, 2020)
        
        XCTAssertEqual(sut.hour, 1)
        XCTAssertEqual(sut.minute, 35)
        XCTAssertEqual(sut.second, 45)
        
        XCTAssertEqual(sut.timezone, .current)
        XCTAssertEqual(sut.locale, .current)
        XCTAssertEqual(sut.calendar, .current)
    }
    
    func test_createCustomDateTime_withLocalInfo() {
        self.sut = CoreDateTime(day: 12, month: 2, year: 2020,
                                hour: 1, minute: 35, second: 45,
                                timezone: TimeZone(abbreviation: "UTC")!,
                                locale: Locale(identifier: "he"),
                                calendar: Calendar(identifier: .japanese))
        
        XCTAssertEqual(sut.day, 12)
        XCTAssertEqual(sut.month, 2)
        XCTAssertEqual(sut.year, 2020)
        
        XCTAssertEqual(sut.hour, 1)
        XCTAssertEqual(sut.minute, 35)
        XCTAssertEqual(sut.second, 45)
        
        XCTAssertEqual(sut.timezone, TimeZone(abbreviation: "UTC"))
        XCTAssertEqual(sut.locale, Locale(identifier: "he"))
        XCTAssertEqual(sut.calendar, Calendar(identifier: .japanese))
    }
    
}
