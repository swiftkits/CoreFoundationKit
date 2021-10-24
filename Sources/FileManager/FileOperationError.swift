//
//  FileOperationError.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

/// Error type used while working with local files
public enum FileOperationError: Error {
    case emptyData
    case notFound
    case accessDenied
}
