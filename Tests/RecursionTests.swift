//
//  RecursionTests.swift
//  Tests
//
//  Created by Oleh Zimin on 29.11.2025.
//

import XCTest
@testable import DataStructuresAlgorithms

final class RecursionTests: XCTestCase {
    func testFibonacciRecursive() {
        // Given
        let fibNegative = 0
        let fib0 = 0
        let fib1 = 1
        let fib8 = 21
        let fib10 = 55
        
        // Then
        XCTAssertEqual(fibNegative, Algorithm.fibonacciRecursive(of: -5))
        XCTAssertEqual(fib0, Algorithm.fibonacciRecursive(of: 0))
        XCTAssertEqual(fib1, Algorithm.fibonacciRecursive(of: 1))
        XCTAssertEqual(fib8, Algorithm.fibonacciRecursive(of: 8))
        XCTAssertEqual(fib10, Algorithm.fibonacciRecursive(of: 10))
    }
    
    func testFibonacci() {
        // Given
        let fibNegative = 0
        let fib0 = 0
        let fib1 = 1
        let fib8 = 21
        let fib10 = 55
        
        // Then
        XCTAssertEqual(fibNegative, Algorithm.fibonacci(of: -5))
        XCTAssertEqual(fib0, Algorithm.fibonacci(of: 0))
        XCTAssertEqual(fib1, Algorithm.fibonacci(of: 1))
        XCTAssertEqual(fib8, Algorithm.fibonacci(of: 8))
        XCTAssertEqual(fib10, Algorithm.fibonacci(of: 10))
    }
    
    func testVerifySortedArray() {
        // Given
        let nums = [9, 7, 12, 18, 2, 3]
        let numsSorted = [1, 2, 5, 8, 15, 21]
        let names = ["Zaha", "Alex", "Ann", "Ben", "Peter", "Camila", "Dionis"]
        let namesSorted = ["Alex", "Ann", "Ben", "Camila", "Dionis", "Peter", "Zaha"]
        
        // Then
        XCTAssertFalse(Algorithm.recursiveVerifySorted(array: nums))
        XCTAssertTrue(Algorithm.recursiveVerifySorted(array: numsSorted))
        XCTAssertFalse(Algorithm.recursiveVerifySorted(array: names))
        XCTAssertTrue(Algorithm.recursiveVerifySorted(array: namesSorted))
    }
}
