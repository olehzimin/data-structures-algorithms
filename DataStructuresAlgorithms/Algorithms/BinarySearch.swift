//
//  BinarySearch.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 21.11.2025.
//

import Foundation

extension Algorithm {
    // Recursive Binary Search divides the array into left and right halves,
    // compares the middle element with the target,
    // and then calls itself recursively on the appropriate half.
    static func binarySearchRecursive<T>(_ element: T, in array: [T]) -> T? where T: Comparable {
        guard array.count > 1 else {
            if let first = array.first, first == element {
                return first
            } else {
                return nil
            }
        }
        
        let midIndex = array.count / 2
        let mid = array[midIndex]
        let leftArray = Array(array.prefix(upTo: midIndex))
        let rightArray = Array(array.suffix(from: midIndex))
        
        if mid == element {
            return mid
        } else if mid > element {
            return binarySearchRecursive(element, in: leftArray)
        } else if mid < element {
            return binarySearchRecursive(element, in: rightArray)
        }
        
        return nil
    }
    
    static func binarySearch<T>(_ element: T, in array: [T]) -> T? where T: Comparable {
        guard !array.isEmpty else { return nil }
        var left = 0
        var right = array.count - 1
        
        while left <= right {
            let midIndex = (right + left) / 2
            let mid = array[midIndex]
            
            if mid == element {
                return mid
            } else if mid > element {
                right = midIndex - 1
            } else if mid < element {
                left = midIndex + 1
            }
        }
        
        return nil
    }
}
