//
//  TestIntMath.swift
//  CoreFoundationKitTests
//
//  Created by Manish on 18/10/21.
//

import Foundation
import XCTest
@testable import CoreFoundationKit

class TestIntMath: XCTestCase {
    
    func test_intHalf() {
        XCTAssertEqual(0.half, 0)
        XCTAssertEqual(-1.half, -0.5)
        XCTAssertEqual(3.half, 1.5)
    }
    
    func test_safeDivide() {
        XCTAssertEqual(0.safeDivide(with: 0), 0)
        XCTAssertEqual(5.safeDivide(with: 0), 0)
        XCTAssertEqual(12.safeDivide(with: -4), -3)
        XCTAssertEqual(4.safeDivide(with: 2), 2)
    }
    
}
