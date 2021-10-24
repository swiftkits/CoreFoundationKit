//
//  Array+Operations.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

public extension Array {
    
    /// Adds the given value at the beginning of the array
    /// - Parameter element: new element that needs to be added
    /// - Returns: `Self`
    @discardableResult
    mutating func prepend(_ element: Element) -> Self {
        self.insert(element, at: 0)
        
        return self
    }
    
    /// Adds the given array items at the beginning of the array
    /// - Parameter elements: new elements array that needs to be added
    /// - Returns: `Self`
    @discardableResult
    mutating func prepend(_ elements: [Element]) -> Self {
        self.insert(contentsOf: elements, at: 0)
        
        return self
    }
    
    /// Safely deletes the item at the given index
    /// - Parameter index: at which items should be deleted
    /// - Returns: `Self` or `nil` if given index is invalid
    @discardableResult
    mutating func safeDelete(at index: Int) -> Element? {
        if index >= self.count || index < 0 { return nil }
        
        return self.remove(at: index)
    }
    
}
