//
//  TestQueue.swift
//  CoreFoundationKitTests
//
//  Created by Manish on 21/10/21.
//

import Foundation
import XCTest
@testable import CoreFoundationKit

class TestQueue: XCTestCase {
    
    private var sut: Queue<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.sut = Queue()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        
        try super.tearDownWithError()
    }
    
}

extension TestQueue {
    
    func test_EnqueueElement() {
        self.sut.enqueue(2)
        self.sut.enqueue(5)
        self.sut.enqueue(7)
        
        XCTAssertEqual(self.sut.allElements, [2,5,7])
    }
    
    func test_DequeuElement() {
        self.sut.enqueue(12)
        self.sut.enqueue(45)
        self.sut.enqueue(37)
        
        self.sut.dequeue()
        
        XCTAssertEqual(self.sut.allElements, [45,37])
        
        self.sut.dequeue()
        
        XCTAssertEqual(self.sut.allElements, [37])
    }
    
}
