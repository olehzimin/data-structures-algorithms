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
    
    print("Stack")
    print("---------------------")
    var stack = Stack<Int>()
    stack.push(25)
    stack.push(26)
    stack.push(27)
    stack.push(28)
    
    print(stack)
    print("Popped element - \(stack.pop())")
    print(stack)
    print("Peek element - \(stack.peek)")
    print()
    
    print("Linked List")
    print("---------------------")
    var linkedList = LinkedList<Int>()
    linkedList.push(1)
    linkedList.push(2)
    linkedList.push(3)
    linkedList.push(4)
    linkedList.push(5)
    
    print(linkedList)
    
    if let node = linkedList.search(for: 4) {
        linkedList.remove(after: node)
    }
    print(linkedList)
    
    if let node = linkedList.search(for: 2) {
        linkedList.insert(35, after: node)
    }
    print(linkedList)
    
    linkedList.remove(5)
    print(linkedList)
    print()
    
    print("Hash Map")
    print("---------------------")
    var hashMap = HashMap<String, Int>()
    hashMap.add(value: 26, for: "Alex")
    hashMap.add(value: 15, for: "Oleh")
    hashMap.add(value: 30, for: "Ann")
    hashMap.add(value: 48, for: "Lex")
    hashMap.add(value: 23, for: "Fedor")
    hashMap.add(value: 10, for: "Anton")
    hashMap.add(value: 65, for: "Marketa")
    
    print(hashMap)
    print("isEmpty - \(hashMap.isEmpty)")
    print("count - \(hashMap.count)")
    print()
    
    print("Selection Sort")
    print("---------------------")
    let names = ["Zaha", "Alex", "Ann", "Ben", "Peter", "Camila", "Dionis"]
    let sortedNames = Algorithm.selectionSort(names)
    
    print("names - \(names)\nsorted - \(sortedNames)")
    print()
    
    print("Merged Sort")
    print("---------------------")
    let ages = [9, 7, 12, 18, 2, 3]
    let sortedAges = Algorithm.mergeSort(ages)
    
    print("names - \(ages)\nsorted - \(sortedAges)")
    print()
    
    print("Recursion")
    print("---------------------")
    print("factorial of 6 = \(Algorithm.factorialRecursive(of: 6))")
    
    print("fibonacci of 8 element = \(Algorithm.fibonacciRecursive(of: 8))")
    
    let numsUnsorted = [9, 7, 12, 18, 2, 3]
    print("verify sorted array \(numsUnsorted) - \(Algorithm.recursiveVerifySorted(array: numsUnsorted))")
    print()
    
    let anyContainer: Any = [1, 2,[8, ["hello", 3.25]], "Alex"]
    print("container - \(anyContainer)")
    
    print("search for 1 - \(Algorithm.recursiveSearch(for: 1, in: anyContainer))")
    print("search for 5 - \(Algorithm.recursiveSearch(for: 5, in: anyContainer))")
    print("search for 'hello' - \(Algorithm.recursiveSearch(for: "hello", in: anyContainer))")
    print()
}
