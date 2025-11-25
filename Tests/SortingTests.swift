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
        var array1 = [5, 2, 3, 1, 8, 1]
        var array2 = ["Zaha", "Alex", "Ann", "Ben", "Peter", "Camila", "Dionis"]
        var array3: [Double] = []
        // When
        let smallest1 = Algorithm.removeSmallest(in: &array1)
        let smallest2 = Algorithm.removeSmallest(in: &array2)
        let smallest3 = Algorithm.removeSmallest(in: &array3)
        // Then
        XCTAssertEqual(smallest1, 1)
        XCTAssertEqual(array1, [5, 2, 3, 8, 1])
        XCTAssertEqual(smallest2, "Alex")
        XCTAssertEqual(array2, ["Zaha", "Ann", "Ben", "Peter", "Camila", "Dionis"])
        XCTAssertNil(smallest3)
    }
}
