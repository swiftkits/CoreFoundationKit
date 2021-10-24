//
//  Data+MagicBytes.swift
//  CoreFoundationKit
//
//  Created by Manish on 24/10/21.
//

import Foundation

// For More signatures
// Check this out https://en.wikipedia.org/wiki/List_of_file_signatures
public extension Data {
    
    /// Retuns file tyepe using magic bytes of the current data object
    var fileType: FileItemType {
        let totalByteCount = 10
        
        guard !self.isEmpty, self.count > totalByteCount else { return .unknown }
        
        var bytes = [UInt8](repeating: 0, count: totalByteCount)
        self.copyBytes(to: &bytes, count: totalByteCount)
        
        if bytes[0...2] == [0xFF, 0xD8, 0xFF] {
            return .jpeg
        }
        
        if bytes[0...3] == [0x89, 0x50, 0x4E, 0x47] {
            return .png
        }
        
        if bytes[0...2] == [0x49, 0x44, 0x33] {
            return .mp3
        }
        
        if bytes[0...7] == [0x00, 0x00, 0x00, 0x20, 0x66, 0x74, 0x79, 0x70] || /* Needs more verification */
            bytes[0...7] == [0x66, 0x74, 0x79, 0x70, 0x4D, 0x53, 0x4E, 0x56] ||
            bytes[0...7] == [0x66, 0x74, 0x79, 0x70, 0x6D, 0x70, 0x34, 0x32] ||
            bytes[0...7] == [0x66, 0x74, 0x79, 0x70, 0x69, 0x73, 0x6F, 0x6D] {
            return .mp4
        }
        
        if bytes[0...3] == [0x25, 0x50, 0x44, 0x46] {
            return .pdf
        }
        
        if bytes[0...3] == [0xEF, 0xBB, 0xBF] /* UTF-8 */ {
            return .txt
        }
        
        return .unknown
    }
    
}
