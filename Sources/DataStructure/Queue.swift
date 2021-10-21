//
//  Queue.swift
//  CoreFoundationKit
//
//  Created by Manish on 20/10/21.
//

import Foundation

public class Queue<Element: Equatable> {
    
    private var dLinkedList = DoublyLinkedList<Element>()
    
    public var allElements: [Element] {
        return self.dLinkedList.getAllIElements()
    }
    
    public func enqueue(_ element: Element) {
        self.dLinkedList.append(element)
    }
    
    @discardableResult
    public func dequeue() -> Bool {
        if self.dLinkedList.isEmpty { return false }
        
        self.dLinkedList.delete()
        
        return true
    }
    
}
