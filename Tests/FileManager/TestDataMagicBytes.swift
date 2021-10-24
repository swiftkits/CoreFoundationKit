//
//  TestDataMagicBytes.swift
//  CoreFoundationKitTests
//
//  Created by Manish on 24/10/21.
//

import Foundation
import XCTest
@testable import CoreFoundationKit

class TestDataMagicBytes: XCTestCase {
    
    let currentBundle = Bundle(for: TestDataMagicBytes.self)
    
    func test_jpegData() throws {
        let fileLocation = currentBundle.url(forResource: "TestImage", withExtension: "jpeg")!
        let jpegData = try Data(contentsOf: fileLocation)
        
        XCTAssertEqual(jpegData.fileType, .jpeg)
        XCTAssertEqual(jpegData.fileType.rawValue, "jpeg")
        XCTAssertEqual(jpegData.fileType.mimeType, "image/jpeg")
        XCTAssertEqual(jpegData.fileType.supportedDirectory, .image)
    }
    
    func test_mp3Data() throws {
        let fileLocation = currentBundle.url(forResource: "TestMP3File", withExtension: "mp3")!
        let mp3Data = try Data(contentsOf: fileLocation)
        
        XCTAssertEqual(mp3Data.fileType, .mp3)
        XCTAssertEqual(mp3Data.fileType.rawValue, "mp3")
        XCTAssertEqual(mp3Data.fileType.mimeType, "audio/mpeg")
        XCTAssertEqual(mp3Data.fileType.supportedDirectory, .audio)
    }
    
    func test_mp4Data() throws {
        let fileLocation = currentBundle.url(forResource: "TestMP4File", withExtension: "mp4")!
        let mp4Data = try Data(contentsOf: fileLocation)
        
        XCTAssertEqual(mp4Data.fileType, .mp4)
        XCTAssertEqual(mp4Data.fileType.rawValue, "mp4")
        XCTAssertEqual(mp4Data.fileType.mimeType, "video/mpeg")
        XCTAssertEqual(mp4Data.fileType.supportedDirectory, .video)
    }
    
    func test_pdfData() throws {
        let fileLocation = currentBundle.url(forResource: "TestPDFFile", withExtension: "pdf")!
        let mp4Data = try Data(contentsOf: fileLocation)
        
        XCTAssertEqual(mp4Data.fileType, .pdf)
        XCTAssertEqual(mp4Data.fileType.rawValue, "pdf")
        XCTAssertEqual(mp4Data.fileType.mimeType, "application/pdf")
        XCTAssertEqual(mp4Data.fileType.supportedDirectory, .document)
    }
    
}
