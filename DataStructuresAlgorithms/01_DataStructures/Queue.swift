//
//  Queue.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 07.12.2025.
//

import Foundation

// MARK: Queue
struct Queue<T> {
    private var head: LinkedNode<T>?
    private var tail: LinkedNode<T>?
    
    private var elementsCount: Int = 0
    
    init() {
        self.head = nil
        self.tail = nil
    }
    
    // MARK: Computed properties
    // Indicator whether the queue is empty
    // Time complexity: O(1)
    var isEmpty: Bool {
        head == nil && tail == nil
    }
    
    // Count of elements in the queue
    // Time complexity: O(1)
    var count: Int {
        elementsCount
    }
    
    // View of the next element in the queue
    // Time complexity: O(1)
    var peek: T? {
        head?.value
    }
    
    // MARK: Methods
    // Pushes new element to the queue end
    // Time complexity: O(1)
    mutating func push(_ element: T) {
        let newTail = LinkedNode(value: element)
        if let tail {
            tail.nextNode = newTail
        } else {
            head = newTail
        }
        
        tail = newTail
        elementsCount += 1
    }
    
    // Pops next element from the queue start
    // Time complexity: O(1)
    mutating func pop() -> T? {
        guard let currentHead = head else { return nil }
        
        head = currentHead.nextNode
        if head == nil {
            tail = nil
        }
        elementsCount -= 1
        
        return currentHead.value
    }
}

extension Queue: CustomStringConvertible {
    // String representation
    // Time complexity: O(n)
    var description: String {
        var string: String = ""
        var elements: [String] = []
        var current = head
        
        while let _current = current {
            elements.append(_current.description)
            current = _current.nextNode
        }
        
        string.append(elements.joined(separator: " <- "))
        
        return string
    }
}
