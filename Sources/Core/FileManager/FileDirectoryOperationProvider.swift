//
//  FileDirectoryOperationProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

public protocol FileDirectoryOperationProvider {
    
    var manager: FileManager { get }
    var rootDir: URL { get }
    
    init(manager: FileManager, rootDir: URL)
    
    func generateFileLocation(for rawData: Data?) throws -> URL
    
    func generateFileLocation(for fileFolderType: FileItemDirectoryType) -> URL
    
    func createFileDirectory(at location: URL) throws
    
    func doesDirectoryExist(at location: URL) -> Bool
}

public extension FileDirectoryOperationProvider {
    
    func generateFileLocation(for rawData: Data?) throws -> URL {
        guard let safeRawData = rawData, !safeRawData.isEmpty else { throw FileOperationError.emptyData }
        
        let fileType = safeRawData.fileType
        
        return self.generateFileLocation(for: fileType.supportedDirectory)
    }
    
    func generateFileLocation(for fileFolderType: FileItemDirectoryType) -> URL {
        return self.rootDir.appendingPathComponent(fileFolderType.name)
    }

    func createFileDirectory(at location: URL) throws {
        try self.manager.createDirectory(at: location,
                                         withIntermediateDirectories: true,
                                         attributes: nil)
    }
    
    func doesDirectoryExist(at location: URL) -> Bool {
        var isDir: ObjCBool = true
        return self.manager.fileExists(atPath: location.path, isDirectory: &isDir)
    }
    
}
