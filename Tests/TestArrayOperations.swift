//
//  TestArrayOperations.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation
import XCTest
@testable import CoreFoundationKit

class TestArrayOperations: XCTestCase {
    
    func test_prependInt() {
        var ints = [Int]()
        
        XCTAssertEqual(ints.prepend(5), [5])
        XCTAssertEqual(ints.prepend(15), [15, 5])
    }
    
    func test_prependArrayOfInt() {
        var ints = [Int]()
        
        XCTAssertEqual(ints.prepend([5]), [5])
        XCTAssertEqual(ints.prepend([20, 15]), [20, 15, 5])
    }
    
}
