//
//  Graph.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 08.12.2025.
//

import Foundation

struct Graph<Vertex> where Vertex: Hashable {
    var edges: [Vertex: [Vertex]] = [:]
    
    mutating func addEdge(from a: Vertex, to b: Vertex) {
        if edges[a] == nil {
            edges[a] = []
        }
        edges[a]?.append(b)
    }
}

struct WeightedGraph<Vertex> where Vertex: Hashable {
    var edges: [Vertex: [WeightedVertex<Vertex>]] = [:]
}

struct WeightedVertex<Value> where Value: Hashable {
    var value: Value
    var cost: UInt
    
    init(value: Value, cost: UInt) {
        self.value = value
        self.cost = cost
    }
}

extension WeightedVertex: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}
