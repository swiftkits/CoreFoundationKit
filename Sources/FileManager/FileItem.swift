//
//  FileItem.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

/// Provides information about Individual local file
public struct FileItem {
    
    /// Name of the file
    public let name: String
    
    /// Data of the file
    public let data: Data
    
    /// Local location of the file
    public let localtion: URL
}
