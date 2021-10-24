//
//  MockFileDirectoryOperationProvider.swift
//  CoreFoundationKitTests
//
//  Created by Manish on 24/10/21.
//

import Foundation
@testable import CoreFoundationKit

class MockFileDirectoryOperationProvider: FileDirectoryOperationProvider {
    
    let manager: FileManager
    let rootDir: URL
    
    required init(manager: FileManager, rootDir: URL) {
        self.manager = manager
        self.rootDir = rootDir
    }
    
}
