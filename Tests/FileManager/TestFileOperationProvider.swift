//
//  TestFileOperationProvider.swift
//  CoreFileManagerKitTests
//
//  Created by Manish on 23/10/21.
//

import XCTest
@testable import CoreFoundationKit

class TestFileOperationProvider: XCTestCase {
    
    private var sut: FileOperationProvider!
    
    override func setUpWithError() throws {
        try super.setUpWithError()

        self.sut = MockFileOperationProvider()
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        try super.tearDownWithError()
    }
    
}

extension TestFileOperationProvider {
    
    func test_saveFile_withEmptyData_shouldFail() {

        XCTAssertThrowsError(try self.sut.save(contentsOf: Data())) { err in
            XCTAssertEqual(err as? FileOperationError, FileOperationError.emptyData)
        }
    }
    
}
