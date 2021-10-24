//
//  FileItemType.swift
//  CoreFoundationKit
//
//  Created by Manish on 24/10/21.
//

import Foundation

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
