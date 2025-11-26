//
//  runOnAppear.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 23.11.2025.
//

import Foundation

// Simulates main() in console type app.
func runOnAppear() {
    print("Binary Search")
    print("---------------------")
    let array = [1, 2, 3, 4, 5]
    
    print(Algorithm.binarySearchRecursive(4, in: array))
    print(Algorithm.binarySearch(4, in: array))
    print()
    
    print("Linked List")
    print("---------------------")
    var linkedList = LinkedList<Int>()
    linkedList.add(1)
    linkedList.add(2)
    linkedList.add(3)
    linkedList.add(4)
    linkedList.add(5)
    
    print(linkedList)
    
    if let node = linkedList.search(for: 4) {
        linkedList.remove(after: node)
    }
    print(linkedList)
    
    if let node = linkedList.search(for: 2) {
        linkedList.insert(35, after: node)
    }
    print(linkedList)
    
    linkedList.remove(element: 5)
    print(linkedList)
    print()
    
    print("Selection Sort")
    print("---------------------")
    let names = ["Zaha", "Alex", "Ann", "Ben", "Peter", "Camila", "Dionis"]
    let sortedNames = Algorithm.selectionSort(names)
    
    print("names - \(names)\nsorted - \(sortedNames)")
    print()
    
    print("Recursion")
    print("---------------------")
    print("factorial of 6 = \(Algorithm.factorialRecursive(of: 6))")
    print()
    
    let anyContainer: Any = [1, 2,[8, ["hello", 3.25]], "Alex"]
    print("container - \(anyContainer)")
    
    print("search for 1 - \(Algorithm.recursiveSearch(for: 1, in: anyContainer))")
    print("search for 5 - \(Algorithm.recursiveSearch(for: 5, in: anyContainer))")
    print("search for 'hello' - \(Algorithm.recursiveSearch(for: "hello", in: anyContainer))")
    print()
}
