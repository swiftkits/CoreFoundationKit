//
//  Stack.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

public struct Stack<Element: Equatable> {
    
    private var items = [Element]()
    
    public var allItems: [Element] { items }
    
    public mutating func push(_ element: Element) {
        self.items.append(element)
    }
    
    public mutating func pop() -> Element? {
        if items.isEmpty { return nil }
        
        return self.items.removeFirst()
    }
    
}
