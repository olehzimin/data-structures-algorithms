//
//  Recursion.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 25.11.2025.
//

import Foundation

extension Algorithm {
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
}
