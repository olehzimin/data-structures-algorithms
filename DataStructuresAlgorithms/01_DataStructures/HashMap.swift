//
//  HashMap.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 01.12.2025.
//

import Foundation

// MARK: HashMap
struct HashMap<Key, Value> where Key: Hashable {
    typealias Element = (key: Key, value: Value)
    
    private var buckets: [[Element]]
    
    private var reservedCapacity: Int
    private var currentCapacity: Int
    private var elementsCount: Int
    
    init() {
        self.buckets = []
        self.reservedCapacity = 2
        self.currentCapacity = 0
        self.elementsCount = 0
        
        self.buckets.reserveCapacity(reservedCapacity)
        self.buckets = Array(repeating: [], count: reservedCapacity)
        
    }
    
    // MARK: Computed properties
    // Count of elements in the stack
    // Time complexity: O(1) updates each time hashmap changes
    var count: Int { elementsCount }
    
    // Indicator whether the hashmap is empty
    // Time complexity: O(1) updates each time hashmap changes
    var isEmpty: Bool { elementsCount == 0 }
    
    private var loadFactor: Double {
        Double(currentCapacity) / Double(reservedCapacity)
    }
    
    // MARK: Methods
    // Adds new value or rewrites if key already exists
    // Time complexity: O(1) and O(n) in case of incresing capacity
    mutating func add(value: Value, for key: Key) {
        if loadFactor > 0.7 {
            increaseCapacity()
        }
        
        let index = index(for: key)
        if buckets[index].isEmpty { currentCapacity += 1 }
        
        // Search in the current index bucket for key
        let bucket = buckets[index]
        let keyIndex = bucket.firstIndex { $0.key == key }
        if let keyIndex {
            buckets[index][keyIndex] = (key, value)
        } else {
            buckets[index].append((key, value))
            elementsCount += 1
        }
    }
    
    // Removes key with its value
    // Time complexity: O(1)
    mutating func remove(for key: Key) {
        let index = index(for: key)
        guard !buckets[index].isEmpty else { return }
        
        // Search in the current index bucket for key and remove
        let oldCount = buckets[index].count
        buckets[index].removeAll { $0.key == key }
        let removed = oldCount - buckets[index].count
        elementsCount -= removed
    }
    
    // Findes element in hashmap nad returns its value
    // Time complexity: O(1)
    func value(for key: Key) -> Value? {
        let index = index(for: key)
        return buckets[index].first(where: { $0.key == key })?.value
    }
    
    // Time complexity: O(n)
    private mutating func increaseCapacity() {
        // Initialize new increased capacity
        reservedCapacity *= 2
        
        // Allocate new buckets array with updated capacity
        var newBuckets: [[Element]] = []
        newBuckets.reserveCapacity(reservedCapacity)
        newBuckets = Array(repeating: [], count: reservedCapacity)
        
        // Remap all elements into new buckets array
        for bucket in buckets {
            for element in bucket {
                let index = index(for: element.key)
                newBuckets[index].append((element.key, element.value))
            }
        }
        
        // Rewrite current state of hash map
        self.buckets = newBuckets
    }
    
    private func index(for key: Key) -> Int where Key: Hashable {
        let hash = key.hashValue
        let positive = abs(hash)
        
        return positive % reservedCapacity
    }
}

// MARK: CustomStringConvertible
extension HashMap: CustomStringConvertible {
    // String representation
    // Time complexety: O(n)
    var description: String {
        var valuesDescriptions: [String] = []
        
        // Map all elements
        for bucket in buckets {
            for element in bucket {
                valuesDescriptions.append("\(element.key): \(element.value)")
            }
        }
        
        let joinedDescription = valuesDescriptions.joined(separator: ", ")
        
        return "[\(joinedDescription)]"
    }
}
