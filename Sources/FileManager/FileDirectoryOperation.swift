//
//  FileDirectoryOperation.swift
//  CoreFoundationKit
//
//  Created by Manish on 24/10/21.
//

import Foundation

/// Provides local directory operations by implementing feature from `FileDirectoryOperationProvider`
public struct FileDirectoryOperation: FileDirectoryOperationProvider {
    
    public let manager: FileManager
    public let rootDir: URL
    
    public init(manager: FileManager, rootDir: URL) {
        self.manager = manager
        self.rootDir = rootDir
    }
    
}
