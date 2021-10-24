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
    private var testBundle: Bundle!
    private var testData: Data!
    private var fileName: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()

        self.sut = MockFileOperationProvider()
        self.testBundle = Bundle(for: TestFileDirectoryOperationProvider.self)
        
        let testFileURL = testBundle.url(forResource: "TestImage", withExtension: "jpeg")!
        self.testData = try Data(contentsOf: testFileURL)
        
        self.fileName = UUID().uuidString
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        self.testBundle = nil
        self.testData = nil
        self.fileName = nil
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
        let savedFile = try self.sut.save(contentsOf: testData, with: fileName)
        
        XCTAssertEqual(savedFile.name, fileName)
        XCTAssertEqual(savedFile.data.count, testData.count)
        XCTAssertEqual(savedFile.localtion.lastPathComponent, fileName + ".jpeg")
        
        let savedPathComponents = savedFile.localtion.pathComponents
        XCTAssertEqual(savedPathComponents[savedPathComponents.count - 2], "Image")
    }
    
    func test_getFile() throws {
        
        let savedFile = try self.sut.save(contentsOf: testData, with: fileName)
        let fetchedFile = try self.sut.getFile(at: savedFile.localtion)
        
        XCTAssertEqual(fetchedFile.data.count, savedFile.data.count)
        XCTAssertEqual(fetchedFile.localtion, savedFile.localtion)
        XCTAssertEqual(fetchedFile.name, savedFile.name)
    }
    
    func test_deleteFile_withEmptyURL_fail() {
        XCTAssertThrowsError(try self.sut.deleteFile(at: URL(fileURLWithPath: "")))
    }
    
    func test_deleteFile() throws {
        
        let savedFile = try self.sut.save(contentsOf: testData, with: fileName)
        
        XCTAssertNoThrow(try self.sut.deleteFile(at: savedFile.localtion))
    }
    
}
