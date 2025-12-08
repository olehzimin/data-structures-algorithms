//
//  Searching.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 21.11.2025.
//

import Foundation

extension Algorithm {
    // Recursive Binary Search divides the array into left and right halves,
    // compares the middle element with the target,
    // and then calls itself recursively on the appropriate half.
    // Time complexety: O(log n)
    static func binarySearchRecursive<C>(_ element: C.Element, in array: C) -> C.Index? where C: RandomAccessCollection, C.Element: Comparable {
        guard array.count > 1 else {
            if let first = array.first, first == element {
                return array.startIndex
            } else {
                return nil
            }
        }
        
        let midIndex = array.index(array.startIndex, offsetBy: array.count / 2)
        let mid = array[midIndex]
        let leftArray = array.prefix(upTo: midIndex)
        let rightArray = array.suffix(from: midIndex)
        
        if mid == element {
            return midIndex
        } else if mid > element {
            return binarySearchRecursive(element, in: leftArray)
        } else if mid < element {
            return binarySearchRecursive(element, in: rightArray)
        }
        
        return nil
    }
    
    // Recursive Binary Search divides the array into left and right halves,
    // using two pointers left and right as bouderies.
    // Time complexety: O(log n)
    static func binarySearch<C>(_ element: C.Element, in array: C) -> C.Index? where C: RandomAccessCollection, C.Element: Comparable {
        guard !array.isEmpty else { return nil }
        var leftIndex = array.startIndex
        var rightIndex = array.index(before: array.endIndex)
        
        while leftIndex <= rightIndex {
            let distance = array.distance(from: leftIndex, to: rightIndex)
            let midIndex = array.index(leftIndex, offsetBy: distance / 2)
            let mid = array[midIndex]
            
            if mid == element {
                return midIndex
            } else if mid > element {
                rightIndex = array.index(before: midIndex)
            } else if mid < element {
                leftIndex = array.index(after: midIndex)
            }
        }
        
        return nil
    }
    
    // Breadth first search (BFS) for searching in the graph,
    // findes the shortest path between vertecies if it exists.
    // Time complexity: O(?)
    static func bfSearch<Vertex>(for destinationVertex: Vertex, form startVertex: Vertex, in graph: Graph<Vertex>) -> Vertex? where Vertex: Hashable {
        guard graph.edges[startVertex] != nil else { return nil }
        
        var found: Vertex? = nil
        var queue = Queue<Vertex>()
        var searched = Set<Vertex>()
        
        queue.push(startVertex)
        while !queue.isEmpty {
            if let currentVertex = queue.pop(), !searched.contains(currentVertex) {
                if currentVertex == destinationVertex {
                    found = currentVertex
                    break
                } else {
                    if let connections = graph.edges[currentVertex] {
                        for connection in connections {
                            queue.push(connection)
                        }
                    }
                    searched.insert(currentVertex)
                }
            }
        }
        
        return found
    }
    
    
}


