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
    }
    
    func test_popFromStack() {
        // Test empty
        XCTAssertNil(self.sut.pop())
        
        // Push & Test
        self.sut.push(5)
        
        XCTAssertEqual(self.sut.pop(), 5)
    }
    
}
