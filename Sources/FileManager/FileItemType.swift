//
//  FileItemType.swift
//  CoreFoundationKit
//
//  Created by Manish on 24/10/21.
//

import Foundation

/// Type of the individual file item
public enum FileItemType: String {
    case jpeg
    case png
    case mp3
    case mp4
    case pdf
    case txt
    case unknown
}

public extension FileItemType {
    
    /// Mime type of the file
    var mimeType: String {
        switch self {
        case .jpeg:
            return "image/jpeg"
        case .png:
            return "image/png"
        case .mp3:
            return "audio/mpeg"
        case .mp4:
            return "video/mpeg"
        case .pdf:
            return "application/pdf"
        case .txt:
            return "text/plain"
        case .unknown:
            return ""
        }
    }
    
    /// Supported Directory, which saves this file type
    var supportedDirectory: FileItemDirectoryType {
        switch self {
        case .jpeg, .png:
            return .image
        case .mp3:
            return .audio
        case .mp4:
            return .video
        case .pdf, .txt:
            return .document
        case .unknown:
            return .unknown
        }
    }
    
}
