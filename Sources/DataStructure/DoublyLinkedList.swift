//
//  DoublyLinkedList.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

public class DoublyLinkedList<Element: Equatable> {
    
    private(set) public var head: DoublyLinkedListItem<Element>?
    private(set) public var tail: DoublyLinkedListItem<Element>?
    
    public var isEmpty: Bool { self.head == nil }
    
    /// Inserts element at the front
    /// - Parameter element: new element that need to be inserted
    public func insert(_ element: Element) {
        
        // Empty list
        if self.checkAndInsertIfListIsEmpty(element) { return }
        
        // Not Empty
        // New item
        let newListItem = DoublyLinkedListItem(prev: nil, next: self.head, element: element)
        
        // Update current head's prev pointer
        self.head?.updatePreviousElement(pointerTo: newListItem)
        
        // sent current head to new item
        self.head = newListItem
    }
    
    /// Appends new element at the end of the list
    /// - Parameter element: new element that need to be added
    public func append(_ element: Element) {
        // Empty list
        if self.checkAndInsertIfListIsEmpty(element) { return }
        
        // Not Empty
        // New item
        let newListItem = DoublyLinkedListItem(prev: self.tail, next: nil, element: element)
        
        // Update current head's prev pointer
        self.tail?.updateNextElement(pointerTo: newListItem)
        
        // sent current head to new item
        self.tail = newListItem
    }
    
    /// Deletes item from front
    public func delete() {
        if self.head === self.tail {
            self.head = nil
            self.tail = nil
            return
        }
        
        self.head = self.head?.next
        self.head?.updatePreviousElement(pointerTo: nil)
    }
    
    public func getAllIElements() -> [Element] {
        var elements = [Element]()
        
        var currentLoopHead = self.head
        while(currentLoopHead != nil) {
            elements.append(currentLoopHead!.element)
            currentLoopHead = currentLoopHead?.next
        }
        
        return elements
    }
    
    func clear() {
        self.head = nil
        self.tail = nil
    }
    
}

extension DoublyLinkedList {
    
    func checkAndInsertIfListIsEmpty(_ element: Element) -> Bool {
        if self.isEmpty {
            let newListItem = DoublyLinkedListItem(prev: nil, next: nil, element: element)
            
            self.head = newListItem
            self.tail = newListItem
            
            return true
        }
        
        return false
    }
    
}

public class DoublyLinkedListItem<Element: Equatable> {

    private(set) public var prev: DoublyLinkedListItem<Element>?
    private(set) public var next: DoublyLinkedListItem<Element>?
    private(set) public var element: Element
    
    public init(prev: DoublyLinkedListItem?,
                next: DoublyLinkedListItem?,
                element: Element) {
        self.prev = prev
        self.next = next
        self.element = element
    }
    
    public func updatePreviousElement(pointerTo newPrev: DoublyLinkedListItem<Element>?) {
        self.prev = newPrev
    }
    
    public func updateNextElement(pointerTo newNext: DoublyLinkedListItem<Element>?) {
        self.next = newNext
    }
    
}
