//
//  Array+Operations.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

public extension Array {
    
    @discardableResult
    mutating func prepend(_ element: Element) -> Self {
        self.insert(element, at: 0)
        
        return self
    }
    
    @discardableResult
    mutating func prepend(_ elements: [Element]) -> Self {
        self.insert(contentsOf: elements, at: 0)
        
        return self
    }
    
}
