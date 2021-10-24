//
//  FileItemDirectoryType.swift
//  CoreFoundationKit
//
//  Created by Manish on 23/10/21.
//

import Foundation

public enum FileItemDirectoryType {
    case image
    case document
    case audio
    case video
    case unknown
    
    var name: String {
        switch self {
        case .image:
            return "Image"
        case .document:
            return "Document"
        case .audio:
            return "Audio"
        case .video:
            return "Video"
        case .unknown:
            return "Unknown"
        }
    }
    
}
