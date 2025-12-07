//
//  LinkedList.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 20.11.2025.
//

import Foundation

// MARK: LinkedList
struct LinkedList<T> where T: Equatable {
    private var head: LinkedNode<T>?
    
    init(head: LinkedNode<T>? = nil) {
        self.head = head
    }
    
    // MARK: Computed properties
    // Indicator whether the stack is empty
    // Time complexity: O(1)
    var isEmpty: Bool {
        head == nil
    }
    
    // Count of elements in the stack
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
    
    // MARK: Methods
    // Pushes new element to the head of the list
    // Time complexity: O(1)
    mutating func push(_ element: T) {
        let newHead = LinkedNode(value: element, nextNode: head)
        head = newHead
    }
    
    // Pops the head element of the list
    // Time complexity: O(1)
    mutating func pop() -> LinkedNode<T>? {
        guard let currentHead = head else { return nil }
        
        head = currentHead.nextNode
        return currentHead
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
    
    // Inserts new element after specified node
    // Time complexety: O(1)
    func insert(_ element: T, after node: LinkedNode<T>) {
        let newNode = LinkedNode(value: element, nextNode: node.nextNode)
        node.nextNode = newNode
    }
    
    // Removes node from the list
    // Time complexety: O(1)
    func remove(after node: LinkedNode<T>) {
        var removedNode = node.nextNode
        node.nextNode = removedNode?.nextNode
    }
    
    // Removes and returns node from the list if elemet is found
    // Time complexety: O(n)
    mutating func remove(_ element: T) -> LinkedNode<T>? {
        var result: LinkedNode<T>? = nil
        var previous: LinkedNode<T>? = nil
        var current: LinkedNode<T>? = head
        
        while let _current = current {
            if _current.value == element {
                break
            }
            previous = current
            current = _current.nextNode
        }
        
        if let current {
            result = current
            if let previous {
                self.remove(after: previous)
            } else {
                head = current.nextNode
            }
        }
        
        return result
    }
}

// MARK: CustomStringConvertible
extension LinkedList: CustomStringConvertible {
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
}

// MARK: - LinkedNode
class LinkedNode<T> {
    private(set) var value: T
    var nextNode: LinkedNode?
    
    init(value: T, nextNode: LinkedNode? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
    
    deinit {
        print("Node \(description) removed")
    }
}

// MARK: CustomStringConvertible
extension LinkedNode: CustomStringConvertible {
    var description: String {
        "[\(value)]"
    }
}
