//
//  TestFileDirectoryOperationProvider.swift
//  CoreFoundationKitTests
//
//  Created by Manish on 24/10/21.
//

import Foundation
@testable import CoreFoundationKit
import XCTest

class TestFileDirectoryOperationProvider: XCTestCase {
    
    private var sut: MockFileDirectoryOperationProvider!
    private var testBundle: Bundle!
    private var testData: Data!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        let manager = FileManager.default
        let rootDir = try manager.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        
        self.sut = MockFileDirectoryOperationProvider(manager: manager, rootDir: rootDir)
        
        self.testBundle = Bundle(for: TestFileDirectoryOperationProvider.self)
        
        let testFileURL = self.testBundle.url(forResource: "TestImage", withExtension: "jpeg")!
        self.testData = try Data(contentsOf: testFileURL)
    }
    
    override func tearDownWithError() throws {
        self.sut = nil
        try super.tearDownWithError()
    }
    
}

extension TestFileDirectoryOperationProvider {
    
    func test_generateFileLocation_emptyData_fail() {
        XCTAssertThrowsError(try self.sut.generateFileLocation(for: Data())) { err in
            XCTAssertEqual(err as? FileOperationError, .emptyData)
        }
    }
    
    func test_generateFileLocation_jpegData_success() throws {
        let fileLocation = try self.sut.generateFileLocation(for: self.testData)
        
        XCTAssertEqual(fileLocation.lastPathComponent, "Image")
    }
    
    func test_generateFileLocation_video_success() {
        let fileLocation = self.sut.generateFileLocation(for: .video)
        
        XCTAssertEqual(fileLocation.lastPathComponent, "Video")
    }
    
    func test_createFileDirectory_document_success() throws {
        let fileLocation = self.sut.generateFileLocation(for: .document)
        try self.sut.createFileDirectory(at: fileLocation)
        
        XCTAssertTrue(self.sut.doesDirectoryExist(at: fileLocation))
        XCTAssertEqual(fileLocation.lastPathComponent, "Document")
    }
    
}
