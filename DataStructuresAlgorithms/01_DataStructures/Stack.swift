//
//  Stack.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 27.11.2025.
//

import Foundation

struct Stack<T>: CustomStringConvertible {
    private var elements: Array<T>
    
    init() {
        self.elements = []
    }
    
    // String representation
    // Time complexety: O(n)
    var description: String {
        "Stack<\(T.self)>\(elements.description)"
    }
    
    var isEmpty: Bool {
        elements.isEmpty
    }
    
    var count: Int {
        elements.count
    }
    
    // View of the top element without removing it
    var peek: T? {
        elements.last
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        isEmpty ? nil : elements.removeLast()
    }
}
