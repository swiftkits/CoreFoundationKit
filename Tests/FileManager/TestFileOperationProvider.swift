//
//  TestFileOperationProvider.swift
//  CoreFileManagerKitTests
//
//  Created by Manish on 23/10/21.
//

import XCTest
@testable import CoreFoundationKit

class TestFileOperationProvider: XCTestCase {
    
    private var sut: MockFileOperationProvider!
    
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
    
    func test_saveFile() throws {
        let testBundle = Bundle(for: TestFileDirectoryOperationProvider.self)
        let testFileURL = testBundle.url(forResource: "TestImage", withExtension: "jpeg")!
        let testData = try Data(contentsOf: testFileURL)
        let fileName = UUID().uuidString
        
        let savedFile = try self.sut.save(contentsOf: testData, with: fileName)
        
        XCTAssertEqual(savedFile.name, fileName)
        XCTAssertEqual(savedFile.data.count, testData.count)
        XCTAssertEqual(savedFile.localtion.lastPathComponent, "\(fileName).jpeg")
        
        let savedPathComponents = savedFile.localtion.pathComponents
        XCTAssertEqual(savedPathComponents[savedPathComponents.count - 2], "Image")
    }
    
}
