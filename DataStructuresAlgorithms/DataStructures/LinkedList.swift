//
//  LinkedList.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 20.11.2025.
//

import Foundation

// Singlepointer LinkedList
struct LinkedList<T>: CustomStringConvertible where T: Equatable {
    private var head: LinkedNode<T>?
    
    init(head: LinkedNode<T>? = nil) {
        self.head = head
    }
    
    // String representation
    // Time complexety: O(n)
    var description: String {
        var string: String = ""
        var elements: [String] = []
        var current = head
        
        while let _current = current {
            elements.append(_current.description)
            current = _current.nextNode
        }
        
        string.append(elements.joined(separator: " -> "))
        
        return string
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    // Time complexity: O(n)
    var count: Int {
        var count = 0
        var current = head
        
        while current != nil {
            count += 1
            current = current?.nextNode
        }
        
        return count
    }
    
    // Adds element to the head of the list
    // Time complexity: O(1)
    mutating func add(_ element: T) {
        let newHead = LinkedNode(value: element, nextNode: head)
        head = newHead
    }
    
    // Searches and returns an element
    // Time complexity: O(n)
    func search(for element: T) -> LinkedNode<T>? {
        var result: LinkedNode<T>? = nil 
        var current = head
        
        while let _current = current {
            if _current.value == element {
                result = _current
                break
            }
            current = current?.nextNode
        }
        
        return result
    }
    
    // Implement
    func insert() { }
    func remove() { }
}

class LinkedNode<T>: CustomStringConvertible where T: Equatable {
    private(set) var value: T
    private(set) var nextNode: LinkedNode?
    
    init(value: T, nextNode: LinkedNode? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
    
    var description: String {
        "[\(value)]"
    }
}
