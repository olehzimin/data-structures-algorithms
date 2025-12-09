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
    // Time complexity: O(v+e)
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
    
    // Dijkstra Algorithm used to find the shortest path between two verticies
    // in a weighted graph (with non-negative edge weights).
    // Time complexity: O(v+e)
    static func dijkstraSearch<Vertex>(
        from start: Vertex,
        to end: Vertex,
        in graph: WeightedGraph<Vertex>
    ) -> [Vertex]? where Vertex: Hashable {
        // Check for existance of vertecies
        guard graph.edges[start] != nil, graph.edges[end] != nil else { return nil }
        
        // Buffer for update min costs and parents for each vertex
        var bufferTable: [Vertex: (costFromStart: UInt, parent: Vertex?)] = [:]
        bufferTable[start] = (costFromStart: 0, parent: nil)
        var processed = Set<Vertex>()
        
        var lowestCostVertex = findLowestCostVertex()
        while lowestCostVertex != nil {
            guard let currentVertex = lowestCostVertex else { break }
            let costFromStart = bufferTable[currentVertex]?.costFromStart ?? 0
            
            if let directions = graph.edges[currentVertex] {
                for direction in directions {
                    let directionCostFromStart = costFromStart + direction.cost
                    
                    // Update costFromStart and parent or add new Vertex to bufferTable
                    if let bufferVertex = bufferTable[direction.value] {
                        if bufferVertex.costFromStart > directionCostFromStart {
                            bufferTable[direction.value]?.costFromStart = directionCostFromStart
                            bufferTable[direction.value]?.parent = currentVertex
                        }
                    } else {
                        bufferTable[direction.value] = (costFromStart: directionCostFromStart, parent: currentVertex)
                    }
                }
            }
            
            processed.insert(currentVertex)
            lowestCostVertex = findLowestCostVertex()
        }
        
        return getPath()
        
        func findLowestCostVertex() -> Vertex? {
            var vertex: Vertex? = nil
            
            for key in bufferTable.keys {
                guard !processed.contains(key) else { continue }
                
                if let currentVertex = bufferTable[vertex ?? key], let bufferVertex = bufferTable[key] {
                    if bufferVertex.costFromStart <= currentVertex.costFromStart {
                        vertex = key
                    }
                }
            }
            
            return vertex
        }
        
        func getPath() -> [Vertex] {
            var path: [Vertex] = []
            
            var parent: Vertex? = end
            while parent != nil {
                guard let current = parent else { break }
                path.append(current)
                
                parent = bufferTable[current]?.parent
            }
            
            return path.reversed()
        }
    }
}


