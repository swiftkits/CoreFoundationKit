//
//  Stack.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

/// Stack data structure
///
/// - Important: LIFO, Last in First Out
///
public struct Stack<Element: Equatable> {
    
    private var items = [Element]()
    
    /// All the items/elements in the stack
    public var allItems: [Element] { items }
    
    /// Pushes new element inside the stack
    /// - Parameter element: element that needs to be pushed in the stack
    public mutating func push(_ element: Element) {
        self.items.append(element)
    }
    
    /// Pops out the last item from the stack
    /// - Returns: Poped item
    public mutating func pop() -> Element? {
        if items.isEmpty { return nil }
        
        return self.items.removeLast()
    }
    
}
