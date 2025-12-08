//
//  Graph.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 08.12.2025.
//

import Foundation

struct Graph<Vertex: Hashable> {
    var edges: [Vertex: [Vertex]] = [:]
    
    mutating func addEdge(from a: Vertex, to b: Vertex) {
        if edges[a] == nil {
            edges[a] = []
        }
        edges[a]?.append(b)
    }
}
