//
//  FileOperation.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

public struct FileOperation<DirectoryOperation: FileDirectoryOperationProvider>: FileOperationProvider {
    
    public let directoryManager: DirectoryOperation
    
    public init(directoryManager: DirectoryOperation) {
        self.directoryManager = directoryManager
    }
    
}
