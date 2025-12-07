//
//  Stack.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 27.11.2025.
//

import Foundation

// MARK: Stack
struct Stack<T> {
    private var elements: Array<T>
    
    init() {
        self.elements = []
    }
    
    // MARK: Computed properties
    // Indicator whether the stack is empty
    // Time complexity: O(1)
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    // Count of elements in the stack
    // Time complexity: O(1)
    var count: Int {
        elements.count
    }
    
    // View of the top element without removing
    // Time complexety: O(1)
    var peek: T? {
        elements.last
    }
    
    // MARK: Methods
    // Pushes new element to stacks top
    // Time complexity: O(1)
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // Pops top element from stack
    // Time complexity: O(1)
    mutating func pop() -> T? {
        isEmpty ? nil : elements.removeLast()
    }
}

// MARK: CustomStringConvertible
extension Stack: CustomStringConvertible {
    // String representation
    // Time complexety: O(n)
    var description: String {
        "Stack<\(T.self)>\(elements.description)"
    }
}
