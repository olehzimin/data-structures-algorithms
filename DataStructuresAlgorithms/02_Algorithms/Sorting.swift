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
        var sorted: [T] = []
        
        var buffer = array
        while sorted.count < array.count {
            if let smallest = popSmallest(in: &buffer) {
                sorted.append(smallest)
            }
        }
        
        return sorted
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
    
    // Recursivly splits given array into halves, sorts each half and merges into sorted array
    // Time complexity: O(n log n)
    static func mergeSort<T>(_ array: [T]) -> [T] where T: Comparable {
        // Base case - naively sorted
        guard array.count > 1 else { return array }
        
        // Split the array into left and right halves
        var (left, right) = split(array)
        
        // Recursivle call mergeSort() on each half
        left = mergeSort(left)
        right = mergeSort(right)
        
        // Merge and sort
        return merge(left, right)
    }
    
    private static func split<T>(_ array: [T]) -> (left: [T], right: [T]) where T: Comparable {
        let midIndex = array.count / 2
        let left = Array(array[..<midIndex])
        let right = Array(array[midIndex...])
        
        return (left, right)
    }
    
    private static func merge<T>(_ left: [T], _ right: [T]) -> [T] where T: Comparable {
        var resultArray: [T] = []
        
        var leftIndex = 0
        var rightIndex = 0
        
        // Merge two sorted arrays
        while leftIndex < left.count && rightIndex < right.count {
            if left[leftIndex] < right[rightIndex] {
                resultArray.append(left[leftIndex])
                leftIndex += 1
            } else {
                resultArray.append(right[rightIndex])
                rightIndex += 1
            }
        }
        
        // In case some of two arrays is larger append remain part of this array
        if leftIndex < left.count {
            resultArray.append(contentsOf: left[leftIndex...])
        } else if rightIndex < right.count {
            resultArray.append(contentsOf: right[rightIndex...])
        }
        
        return resultArray
    }
}

