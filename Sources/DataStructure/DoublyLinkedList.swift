//
//  DoublyLinkedList.swift
//  CoreFoundationKit
//
//  Created by Manish on 18/10/21.
//

import Foundation

/// DoublyLinkedList data structure
///
/// - Important: Supports traversal from both next and prev nodes
///
public class DoublyLinkedList<Element: Equatable> {
    
    /// First node of the list
    private(set) public var head: DoublyLinkedListItem<Element>?
    
    /// Last Node of the list
    private(set) public var tail: DoublyLinkedListItem<Element>?
    
    /// Indicates whether list is empty or not
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
    
    /// Fetches all the elements in the list
    /// - Returns: Array of elelements
    public func getAllIElements() -> [Element] {
        var elements = [Element]()
        
        var currentLoopHead = self.head
        while(currentLoopHead != nil) {
            elements.append(currentLoopHead!.element)
            currentLoopHead = currentLoopHead?.next
        }
        
        return elements
    }
    
    /// Removes all the elements from the list
    public func clear() {
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

/// Individual Node of the `DoublyLinkedList`
public class DoublyLinkedListItem<Element: Equatable> {
    
    /// Previous node
    private(set) public var prev: DoublyLinkedListItem<Element>?
    
    /// Next node
    private(set) public var next: DoublyLinkedListItem<Element>?
    
    /// Value of the node
    private(set) public var element: Element
    
    /// Creates Node for `DoublyLinkedList` with provided parameters
    /// - Parameters:
    ///   - prev: Previous node from this node
    ///   - next: Next node from this node
    ///   - element: Value of this node
    public init(prev: DoublyLinkedListItem?,
                next: DoublyLinkedListItem?,
                element: Element) {
        self.prev = prev
        self.next = next
        self.element = element
    }
    
    /// Updates the previous node item to the provided node
    /// - Parameter newPrev: New previous node, which will be replacing existing
    public func updatePreviousElement(pointerTo newPrev: DoublyLinkedListItem<Element>?) {
        self.prev = newPrev
    }
    
    /// Updates the next node item to the provided node
    /// - Parameter newNext: New next node, which will be replacing existing
    public func updateNextElement(pointerTo newNext: DoublyLinkedListItem<Element>?) {
        self.next = newNext
    }
    
}
