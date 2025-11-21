//
//  main.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 20.11.2025.
//

import Foundation

var testArray = [1, 2, 5, 9, 15, 19]

let search1 = Algorithm.binarySearchRecursive(25, in: testArray)
let search2 = Algorithm.binarySearch(19, in: testArray)

print(search1)
print(search2)

