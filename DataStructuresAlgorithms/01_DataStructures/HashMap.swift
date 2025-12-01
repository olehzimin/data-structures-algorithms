//
//  HashMap.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 01.12.2025.
//

import Foundation

struct HashMap<Key, Value>: CustomStringConvertible where Key: Hashable {
    typealias Element = (key: Key, value: Value)
    
    private var elements: [Element?]
    
    private var reservedCapacity: Int
    private var currentCapacity: Int
    
    init() {
        self.elements = []
        self.reservedCapacity = 2
        self.currentCapacity = 0
        
        self.elements.reserveCapacity(reservedCapacity)
        self.elements = Array(repeating: nil, count: reservedCapacity)
        
    }
    
    var description: String {
        let existingElements = elements.compactMap { $0 }
        return String(existingElements.description)
    }
    
    private var loadFactor: Double {
        Double(currentCapacity) / Double(reservedCapacity)
    }
    
    mutating func add(_ value: Value, for key: Key) {
        if loadFactor >= 0.7 {
            increaseCapacity()
        }
        
        let index = index(for: key)
        elements[index] = (key, value)
        currentCapacity += 1
    }
    
    private mutating func increaseCapacity() {
        let bufferElements = elements.compactMap { $0 }
        
        // Increase capacity
        reservedCapacity *= 2
        currentCapacity = 0
        elements.reserveCapacity(reservedCapacity)
        elements = Array(repeating: nil, count: reservedCapacity)
        
        // Remap all existing elements
        for bufferElement in bufferElements {
            add(bufferElement.value, for: bufferElement.key)
        }
    }
    
    private func index(for key: Key) -> Int where Key: Hashable {
        let hash = key.hashValue
        let positive = abs(hash)
        
        return positive % reservedCapacity
    }
}
