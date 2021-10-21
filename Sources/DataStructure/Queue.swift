//
//  Queue.swift
//  CoreFoundationKit
//
//  Created by Manish on 20/10/21.
//

import Foundation

public class Queue<Element: Equatable> {
    
    private var dLinkedList = DoublyLinkedList<Element>()
    
    public func enqueue(_ element: Element) {
        self.dLinkedList.append(element)
    }
    
//    public func dequeue() -> Element? {
//        if self.dLinkedList.isEmpty { return nil }
//        
//        return self.items.removeLast()
//    }
    
}
