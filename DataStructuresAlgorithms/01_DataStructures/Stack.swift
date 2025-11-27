//
//  Stack.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 27.11.2025.
//

import Foundation

struct Stack<T>: CustomStringConvertible {
    private var array: Array<T>
    
    init() {
        self.array = []
    }
    
    // String representation
    // Time complexety: O(n)
    var description: String {
        "Stack<\(T.self)>\(array.description)"
    }
    
    var isEmpty: Bool {
        array.isEmpty
    }
    
    var count: Int {
        array.count
    }
    
    // View of the top element without removing it
    var peek: T? {
        array.last
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        isEmpty ? nil : array.removeLast()
    }
}
