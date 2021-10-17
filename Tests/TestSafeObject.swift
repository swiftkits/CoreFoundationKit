//
//  TestSafeObject.swift
//  CoreFoundationKitTests
//
//  Created by Manish on 18/10/21.
//

import Foundation
import XCTest
@testable import CoreFoundationKit

class TestSafeObject: XCTestCase {
    
    func test_optionalInt() {
        XCTAssertEqual(safe(nil), 0)
        XCTAssertEqual(safe(1), 1)
    }
    
    func test_optionalDouble() {
        XCTAssertEqual(safe(nil), 0.0)
        XCTAssertEqual(safe(1.0), 1.0)
    }
    
    func test_optionalString() {
        XCTAssertEqual(safe(nil), "")
        XCTAssertEqual(safe("Test str"), "Test str")
    }
    
    func test_optionalBool() {
        XCTAssertEqual(safe(nil), false)
        XCTAssertEqual(safe(true), true)
    }
    
}
