//
//  Queue.swift
//  CoreFoundationKit
//
//  Created by Manish on 20/10/21.
//

import Foundation

/// Queue data structures
public class Queue<Element: Equatable> {
    
    private var dLinkedList = DoublyLinkedList<Element>()
    
    /// All the elements inside the `Queue`
    public var allElements: [Element] {
        return self.dLinkedList.getAllIElements()
    }
    
    /// Enqueues new element at the end of the queue
    /// - Parameter element: <#element description#>
    public func enqueue(_ element: Element) {
        self.dLinkedList.append(element)
    }
    
    
    /// Dequeues first element from the `Queueu`
    /// - Returns: Boolean result, indicating whether dequeue operation succeeded or failed
    @discardableResult
    public func dequeue() -> Bool {
        if self.dLinkedList.isEmpty { return false }
        
        self.dLinkedList.delete()
        
        return true
    }
    
}
