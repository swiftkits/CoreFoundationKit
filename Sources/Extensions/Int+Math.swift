//
//  Int+Math.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

public extension Int {
    
    /// Returns half of the given value
    var half: Double {
        return Double(self) / 2.0
    }
    
    /// Provide safety layer for division operation
    /// - Parameter divider: value of the divider
    ///
    /// - Important: If divider is `zero`, then result will also be zero (safety check)
    ///
    /// - Returns: result of the division of type `Double`
    func safeDivide(with divider: Int) -> Double {
        if divider == .zero { return .zero }
        
        return Double(self) / Double(divider)
    }
    
}
