//
//  MockFileOperationProvider.swift
//  CoreFileManagerKitTests
//
//  Created by Manish on 23/10/21.
//

import Foundation
@testable import CoreFoundationKit

struct MockFileOperationProvider: FileOperationProvider {
    
    var directoryManager: MockFileDirectoryOperationProvider
    
    init(directoryManager: MockFileDirectoryOperationProvider) {
        self.directoryManager = directoryManager
    }
    
    init() {
        let fileManager = FileManager.default
        let rootDir = try! fileManager.url(for: .cachesDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        let mockDirOp = MockFileDirectoryOperationProvider(manager: fileManager, rootDir: rootDir)
        
        self.directoryManager = mockDirOp
    }
    
}
