//
//  HashMap.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 01.12.2025.
//

import Foundation

struct HashMap<Key, Value>: CustomStringConvertible where Key: Hashable {
    typealias Element = (key: Key, value: Value)
    
    private var buckets: [[Element]]
    
    private var reservedCapacity: Int
    private var currentCapacity: Int
    
    init() {
        self.buckets = []
        self.reservedCapacity = 2
        self.currentCapacity = 0
        
        self.buckets.reserveCapacity(reservedCapacity)
        self.buckets = Array(repeating: [], count: reservedCapacity)
        
    }
    
    var description: String {
        let existingElements = buckets.compactMap { $0 }
        return String(existingElements.description)
    }
    
    private var loadFactor: Double {
        Double(currentCapacity) / Double(reservedCapacity)
    }
    
    mutating func add(_ value: Value, for key: Key) {
        if loadFactor > 0.7 {
            increaseCapacity()
        }
        
        let index = index(for: key)
        if buckets[index].isEmpty { currentCapacity += 1 }
        buckets[index].append((key, value))
    }
    
    private mutating func increaseCapacity() {
//        let bufferElements = elements.compactMap { $0 }
//        
//        // Increase capacity
//        reservedCapacity *= 2
//        currentCapacity = 0
//        elements.reserveCapacity(reservedCapacity)
//        elements = Array(repeating: nil, count: reservedCapacity)
//        
//        // Remap all existing elements
//        for bufferElement in bufferElements {
//            add(bufferElement.value, for: bufferElement.key)
//        }
        
        // Initialize new increased capacity
        let newReservedCapacity = reservedCapacity * 2
        var newCurrentCapacity = 0
        
        // Allocate new buckets array with updated capacity
        var newBuckets: [[Element]] = []
        newBuckets.reserveCapacity(newReservedCapacity)
        newBuckets = Array(repeating: [], count: newReservedCapacity)
        
        // Remap all elements into new buckets array
        for bucket in buckets {
            for element in bucket {
                let index = index(for: element.key)
                if newBuckets[index].isEmpty { newCurrentCapacity += 1 }
                newBuckets[index].append((element.key, element.value))
            }
        }
        
        // Rewrite current state of hash map
        self.buckets = newBuckets
        self.reservedCapacity = newReservedCapacity
        self.currentCapacity = newCurrentCapacity
    }
    
    private func index(for key: Key) -> Int where Key: Hashable {
        let hash = key.hashValue
        let positive = abs(hash)
        
        return positive % reservedCapacity
    }
}
