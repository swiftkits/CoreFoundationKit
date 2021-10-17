//
//  SafeObject.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

public func safe(_ int: Int?) -> Int {
    return int ?? 0
}

public func safe(_ double: Double?) -> Double {
    return double ?? 0
}

public func safe(_ string: String?) -> String {
    return string ?? ""
}

public func safe(_ bool: Bool?) -> Bool {
    return bool ?? false
}
