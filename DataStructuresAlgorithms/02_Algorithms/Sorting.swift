//
//  Sorting.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 25.11.2025.
//

import Foundation

extension Algorithm {
    // Findes smallest element in the given array and appends to the result array
    // Time complexity: O(n^2)
    static func selectionSort<T>(_ array: [T]) -> [T] where T: Comparable {
        guard array.count > 1 else { return array }
        var result: [T] = []
        
        var buffer = array
        while result.count < array.count {
            if let smallest = popSmallest(in: &buffer) {
                result.append(smallest)
            }
        }
        
        return result
    }
    
    // Findes and pops smallest element in the given array
    // Time complexity: O(n)
    static func popSmallest<T>(in array: inout [T]) -> T? where T: Comparable {
        guard !array.isEmpty else { return nil }
        var smallestIndex: Int = array.startIndex
        
        for i in array.indices {
            if array[i] < array[smallestIndex] {
                smallestIndex = i
            }
        }
        
        return array.remove(at: smallestIndex)
    }
}

