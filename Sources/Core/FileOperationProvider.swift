//
//  FileOperationProvider.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

/// Abstract layer of core features for working with local files.
public protocol FileOperationProvider {
    
    func save(contentsOf data: Data?, with name: String) throws -> FileItem
    
}

public extension FileOperationProvider {
    
    func save(contentsOf data: Data?, with name: String = UUID().uuidString) throws -> FileItem {
        guard let safeData = data, safeData.isEmpty == false else { throw FileOperationError.emptyData }
        
        do {
            try safeData.write(to: URL(fileURLWithPath: ""))
        } catch {
            throw error
        }
        
        return FileItem(name: name, data: safeData, localtion: URL(fileURLWithPath: ""))
    }
    
}
