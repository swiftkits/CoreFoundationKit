//
//  Int+Math.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

public extension Int {
    
    var half: Double {
        return Double(self) / 2.0
    }
    
    func safeDivide(with divider: Int) -> Double {
        if divider == .zero { return .zero }
        
        return Double(self) / Double(divider)
    }
    
}
