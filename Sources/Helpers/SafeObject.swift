//
//  SafeObject.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

/// Safely unwraps provided `Integer` value
/// - Parameter int: optional integer value
/// - Returns: given integer value or `zero`
public func safe(_ int: Int?) -> Int {
    return int ?? 0
}

/// Safely unwraps provided `Double` value
/// - Parameter double: optional double value
/// - Returns: given double value or `zero`
public func safe(_ double: Double?) -> Double {
    return double ?? 0
}

/// Safely unwraps provided `String` value
/// - Parameter string: optional double value
/// - Returns: given string value or `empty string`
public func safe(_ string: String?) -> String {
    return string ?? ""
}

/// Safely unwraps provided `Bool` value
/// - Parameter bool: optional bool value
/// - Returns: given bool value or `false`
public func safe(_ bool: Bool?) -> Bool {
    return bool ?? false
}
