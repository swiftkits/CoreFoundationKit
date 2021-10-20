//
//  TestStack.swift
//  CoreFoundationKitTests
//
//  Created by Manish on 18/10/21.
//

import Foundation
import XCTest
@testable import CoreFoundationKit

class TestStack: XCTestCase {
    
    private var sut: Stack<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.sut = Stack()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        
        try super.tearDownWithError()
    }
    
}

extension TestStack {
    
    func test_pushIntoStack() {
        // Test empty
        XCTAssertEqual(self.sut.allItems, [])
        
        // Push & Test
        self.sut.push(5)
        XCTAssertEqual(self.sut.allItems, [5])
        
        // Push more & Test order
        self.sut.push(3)
        self.sut.push(5)
        self.sut.push(10)
        XCTAssertEqual(self.sut.allItems.last, 10)
    }
    
    func test_popFromStack() {
        // Test empty
        XCTAssertNil(self.sut.pop())
        
        // Push & Test
        self.sut.push(5)
        XCTAssertEqual(self.sut.pop(), 5)
        
        // Push more & Test order
        self.sut.push(2)
        self.sut.push(8)
        self.sut.push(12)
        XCTAssertEqual(self.sut.pop(), 12)
        XCTAssertEqual(self.sut.allItems, [2, 8])
    }
    
}
