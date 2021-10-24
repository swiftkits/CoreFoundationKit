//
//  FileDirectoryOperationProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

/// Provides core functionalities for working with file directory
public protocol FileDirectoryOperationProvider {
    
    /// Local system file manager
    var manager: FileManager { get }
    
    /// Root directory inside the aapplication sandbox (local system)
    var rootDir: URL { get }
    
    /// Creates `FileDirectoryOperationProvider` with provided local file manager and root directory
    ///
    /// - Parameters:
    ///     - manager: Local system file manager
    ///     - rootDir: Root direcotry inside application sandbox
    ///
    init(manager: FileManager, rootDir: URL)
    
    /// Generates local file location with provided data
    ///
    /// - Parameters:
    ///     - for: Data object, used for local file operations
    ///
    /// - Throws:
    ///     - When data is not valid (nil or empty)
    ///
    /// - Returns: Local file location
    func generateFileLocation(for rawData: Data?) throws -> URL
    
    /// Generates local file location with provided data
    ///
    /// - Parameters:
    ///     - for: `FileItemDirectoryType`, used for local file operations
    ///
    /// - Returns: Local file location
    func generateFileLocation(for fileFolderType: FileItemDirectoryType) -> URL
    
    /// Creates a new directory at provided location
    ///
    /// - Parameters:
    ///     - at: Location, where directory should be created
    ///
    /// - Throws:
    ///     - When locatin is not valid or inaccessible
    func createFileDirectory(at location: URL) throws
    
    /// Check if directory exists at provided location
    ///
    /// - Parameters:
    ///     - location: at which directory is present or not
    ///
    /// - Returns: Local file location
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
