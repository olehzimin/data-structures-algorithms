//
//  runOnAppear.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 23.11.2025.
//

import Foundation

// Simulates main() in console type app.
func runOnAppear() {
    let array = [1, 2, 3, 4, 5]
    
    print(Algorithm.binarySearchRecursive(4, in: array))
    print(Algorithm.binarySearch(4, in: array))
}
