//
//  TestDoublyLinkedList.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation
import XCTest
@testable import CoreFoundationKit

class TestDoublyLinkedList: XCTestCase {
    private var sut: DoublyLinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        self.sut = DoublyLinkedList()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        try super.tearDownWithError()
    }
}

// MARK: - Test insert
extension TestDoublyLinkedList {
    
    func test_insertAtTheFontOfTheList() {
        self.sut.insert(5)
        
        XCTAssertFalse(self.sut.isEmpty)
        XCTAssertEqual(self.sut.head?.element, 5)
        
        // Insert more, test head & tail
        self.sut.insert(8)
        self.sut.insert(12)
        XCTAssertEqual(self.sut.head?.element, 12)
        XCTAssertEqual(self.sut.tail?.element, 5)
    }
    
    func test_appendToTheList() {
        self.sut.append(3)
        
        XCTAssertFalse(self.sut.isEmpty)
        XCTAssertEqual(self.sut.head?.element, 3)
        
        // Insert more, test head & tail
        self.sut.append(9)
        self.sut.append(11)
        XCTAssertEqual(self.sut.head?.element, 3)
        XCTAssertEqual(self.sut.tail?.element, 11)
    }
    
    func test_mixedInsertAndappendToTheList() {
        self.sut.append(3)
        
        XCTAssertFalse(self.sut.isEmpty)
        XCTAssertEqual(self.sut.head?.element, 3)
        
        // Insert more, test head & tail
        self.sut.insert(6)
        self.sut.append(9)
        self.sut.insert(8)
        self.sut.append(17)
        XCTAssertEqual(self.sut.head?.element, 8)
        XCTAssertEqual(self.sut.tail?.element, 17)
    }
    
}

// MARK: - Test Delete
extension TestDoublyLinkedList {
    
    func test_deleteAfterInsert() {
        self.sut.append(3)
        
        XCTAssertFalse(self.sut.isEmpty)
        XCTAssertEqual(self.sut.head?.element, 3)
        
        // Delete and test
        self.sut.delete()
        XCTAssertTrue(self.sut.isEmpty)
        XCTAssertNil(self.sut.head)
        XCTAssertNil(self.sut.tail)
    }
    
    func test_deleteAfterAppend() {
        self.sut.append(7)
        
        XCTAssertFalse(self.sut.isEmpty)
        XCTAssertEqual(self.sut.head?.element, 7)
        
        // Delete and test
        self.sut.append(5)
        self.sut.delete()
        XCTAssertFalse(self.sut.isEmpty)
        XCTAssertEqual(self.sut.head?.element, 5)
        XCTAssertEqual(self.sut.tail?.element, 5)
    }
    
    func test_deleteWithMixedInsertAndAppend() {
        self.sut.insert(7)
        self.sut.append(5)
        self.sut.insert(12)
        
        self.sut.delete()
        
        XCTAssertFalse(self.sut.isEmpty)
        XCTAssertEqual(self.sut.head?.element, 7)
        XCTAssertEqual(self.sut.tail?.element, 5)
    }
    
}
