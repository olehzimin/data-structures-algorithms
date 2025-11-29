//
//  Recursion.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 25.11.2025.
//

import Foundation

extension Algorithm {
    // MARK: Fibonacci
    // Time Complexity: O(n)
    static func fibonacci(of element: Int) -> Int {
        guard element > 0 else { return 0 }
        guard element > 2 else { return 1 }
        
        var result = 0
        var prelast = 1
        var last = 1
        for i in 2..<element {
            result = last + prelast
            prelast = last
            last = result
        }
        
        return result
    }
    
    // Time Complexity: O(2^n)
    static func fibonacciRecursive(of element: Int) -> Int {
        // Base cases
        guard element > 0 else { return 0 }
        guard element > 2 else { return 1 }
        
        return fibonacciRecursive(of: element - 1) + fibonacciRecursive(of: element - 2)
    }
    
    // MARK: Factorial
    static func factorial(of number: Int) -> Int? {
        guard number >= 0 else { return nil }
        var result = 1
        var current = number
        
        while current > 0 {
            result *= current
            current -= 1
        }
        
        return result
    }
    
    static func factorialRecursive(of number: Int) -> Int? {
        guard number >= 0 else { return nil }
        if number <= 1 { return 1 }
        
        return number * (factorialRecursive(of: number - 1) ?? 1)
    }
    
    // MARK: Search
    // Searches for item in undefiened container that may be item itself and returns IndexPath to this item
    static func recursiveSearch<T>(for item: T, in container: Any) -> IndexPath? where T: Equatable {
        var indexPath: IndexPath? = nil
        
        if item == container as? T {
            indexPath = IndexPath()
        }
        
        if let collection = container as? any RandomAccessCollection {
            var position = 0
            
            for innerContainer in collection {
                if let innerPath = recursiveSearch(for: item, in: innerContainer) {
                    indexPath = IndexPath(index: position)
                    indexPath?.append(innerPath)
                    break
                }
                position += 1
            }
        }
        
        return indexPath
    }
    
    // MARK: Verify
    // Verify sorted array recursively
    static func recursiveVerifySorted<T>(array: [T]) -> Bool where T: Comparable {
        // Base case
        guard array.count > 1 else { return true }
        
        if array[array.count - 1] >= array[array.count - 2] {
            let innerArray = Array(array.dropLast())
            return recursiveVerifySorted(array: innerArray)
        }
        
        return false
    }
}
