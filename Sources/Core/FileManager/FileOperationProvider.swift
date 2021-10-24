//
//  FileOperationProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

/// Abstract layer of core features for working with local files.
public protocol FileOperationProvider {
    
    associatedtype DirectoryManager: FileDirectoryOperationProvider
    var directoryManager: DirectoryManager { get }
    
    init(directoryManager: DirectoryManager)
    
    func save(contentsOf data: Data?, with name: String) throws -> FileItem
    func getFile(at location: URL) throws -> FileItem
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
