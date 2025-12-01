//
//  SortingTests.swift
//  Tests
//
//  Created by Oleh Zimin on 25.11.2025.
//

import XCTest
@testable import DataStructuresAlgorithms

final class SortingTests: XCTestCase {
    func testPopSmallest() {
        // Given
        var array1 = [5, 2, 31, 3, 1, 8, 1, 25]
        var array2 = ["Zaha", "Alex", "Ann", "Ben", "Peter", "Camila", "Dionis"]
        var array3: [Double] = []
        // When
        let smallest1 = Algorithm.popSmallest(in: &array1)
        let smallest2 = Algorithm.popSmallest(in: &array2)
        let smallest3 = Algorithm.popSmallest(in: &array3)
        // Then
        XCTAssertEqual(smallest1, 1)
        XCTAssertEqual(array1, [5, 2, 3, 8, 1])
        XCTAssertEqual(smallest2, "Alex")
        XCTAssertEqual(array2, ["Zaha", "Ann", "Ben", "Peter", "Camila", "Dionis"])
        XCTAssertNil(smallest3)
    }
    
    func testQuickSort() {
        // Given
        let array1 = [5, 2, 31, 3, 1, 8, 1, 25]
        let array2 = ["Zaha", "Alex", "Ann", "Ben", "Peter", "Camila", "Dionis"]
        let array3: [Double] = []
        // When
        let sorted1 = [1, 1, 2, 3, 5, 8, 25, 31]
        let sorted2 = ["Alex", "Ann", "Ben", "Camila", "Dionis", "Peter", "Zaha"]
        let sorted3: [Double] = []
        // Then
        XCTAssertEqual(Algorithm.quickSort(array1), sorted1)
        XCTAssertEqual(Algorithm.quickSort(array2), sorted2)
        XCTAssertEqual(Algorithm.quickSort(array3), sorted3)
    }
}
