//
//  SearchingTests.swift
//  Tests
//
//  Created by Oleh Zimin on 23.11.2025.
//

import XCTest
@testable import DataStructuresAlgorithms

final class SearchingTests: XCTestCase {
    
    func testBinarySearch_OrdinaryArray() {
        // Given
        let array = [1, 2, 3, 5, 8, 15]
        // When
        let search1 = Algorithm.binarySearch(1, in: array)
        let search3 = Algorithm.binarySearch(3, in: array)
        let search15 = Algorithm.binarySearch(15, in: array)
        let search20 = Algorithm.binarySearch(20, in: array)
        // Then
        XCTAssertEqual(search1, 0)
        XCTAssertEqual(search3, 2)
        XCTAssertEqual(search15, 5)
        XCTAssertNil(search20)
    }
    
    func testBinarySearch_EmptyArray() {
        // Given
        let array: [Int] = []
        // When
        let search = Algorithm.binarySearch(1, in: array)
        // Then
        XCTAssertNil(search)
    }
    
    func testBinarySearch_Perfomance() {
        let array = Array(1...1_000_000)
        
        measure {
            _ = Algorithm.binarySearch(1_000_000, in: array)
        }
    }
    
    func testBinarySearchRecursive_OrdinaryArray() {
        // Given
        let array = [1, 2, 3, 5, 8, 15]
        // When
        let search1 = Algorithm.binarySearchRecursive(1, in: array)
        let search3 = Algorithm.binarySearchRecursive(3, in: array)
        let search15 = Algorithm.binarySearchRecursive(15, in: array)
        let search20 = Algorithm.binarySearchRecursive(20, in: array)
        // Then
        XCTAssertEqual(search1, 0)
        XCTAssertEqual(search3, 2)
        XCTAssertEqual(search15, 5)
        XCTAssertNil(search20)
    }
    
    func testBinarySearchRecursive_EmptyArray() {
        // Given
        let array: [Int] = []
        // When
        let search = Algorithm.binarySearchRecursive(1, in: array)
        // Then
        XCTAssertNil(search)
    }
    
    func testBinarySearchRecursive_Perfomance() {
        let array = Array(1...1_000_000)
        
        measure {
            _ = Algorithm.binarySearchRecursive(1_000_000, in: array)
        }
    }
    
    func testBFSearch() {
        var graph = Graph<String>()
        graph.edges = [
            "Oleh": ["Alex", "Petr", "Bob"],
            "Alex": ["Ann", "Fedor"],
            "Petr": ["Oleh", "Max", "Kate"],
            "Bob": ["Max"],
            "Ann": ["Max"],
            "Fedor": [],
            "Kate": ["Max"]
        ]
    }
}
