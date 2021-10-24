//
//  FileOperationProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

/// Abstract layer of core features for working with local files.
public protocol FileOperationProvider {
    /// Local file directory manager supported by the system
    associatedtype DirectoryManager: FileDirectoryOperationProvider
    var directoryManager: DirectoryManager { get }
    
    /// Create `FileOperationProvider` with provided `DirectoryManager`
    init(directoryManager: DirectoryManager)
    
    /// Saaved given file data in local file sytem
    ///
    /// - Parameters:
    ///     - contentsOf: data object, that needs to be saved
    ///     - with: Name used for saving data as file
    ///
    /// - Throws:
    ///     - When data is not valid (nil or empty)
    ///
    /// - Returns: Saved `FileItem`
    func save(contentsOf data: Data?, with name: String) throws -> FileItem
    
    /// Fetches the file at given location
    ///
    /// - Parameters:
    ///     - at: Location, used for fetching the file
    ///
    /// - Throws:
    ///     - When file is not found
    ///     - When file is not accessible
    ///     - When provided url is not a file location
    ///
    /// - Returns: Fetched `FileItem`
    func getFile(at location: URL) throws -> FileItem
    
    /// Deletes the file at given location
    ///
    /// - Parameters:
    ///     - at: Location, used for deleting the file
    ///
    /// - Throws:
    ///     - When file is not found
    ///     - When file is not accessible
    ///     - When provided url is not a file location
    ///
    /// - Returns: Fetched `FileItem`
    func deleteFile(at location: URL) throws
}

public extension FileOperationProvider {
    
    func save(contentsOf data: Data?, with name: String = UUID().uuidString) throws -> FileItem {
        guard let safeData = data, safeData.isEmpty == false else { throw FileOperationError.emptyData }
        
        let fileDirectory = try self.directoryManager.generateFileLocation(for: safeData)
        
        if self.directoryManager.doesDirectoryExist(at: fileDirectory) == false {
            try self.directoryManager.createFileDirectory(at: fileDirectory)
        }
        
        let fullFilePath = fileDirectory.appendingPathComponent(name).appendingPathExtension(safeData.fileType.rawValue)
        
        try safeData.write(to: fullFilePath)
        
        return FileItem(name: name, data: safeData, localtion: fullFilePath)
    }
    
    func getFile(at location: URL) throws -> FileItem {
        guard self.directoryManager.manager.fileExists(atPath: location.path) else {
            throw FileOperationError.notFound
        }
        
        guard self.directoryManager.manager.isReadableFile(atPath: location.path) else {
            throw FileOperationError.accessDenied
        }
        
        let fileData = try Data(contentsOf: location)
        let fileExtension = "." + location.pathExtension
        let fileName = location.lastPathComponent.replacingOccurrences(of: fileExtension, with: "")
        
        return FileItem(name: fileName, data: fileData, localtion: location)
    }
    
    func deleteFile(at location: URL) throws {
        try self.directoryManager.manager.removeItem(at: location)
    }
    
}
