//
//  Tests.swift
//  Tests
//
//  Created by Oleh Zimin on 23.11.2025.
//

import XCTest
@testable import DataStructuresAlgorithms

final class Tests: XCTestCase {
    
    func testExample() {
        // Given
        let array = [1, 2, 3, 5, 8, 15]
        // When
        let search = Algorithm.binarySearch(1, in: array)
        // Then
        XCTAssertEqual(search, 1)
    }
}
