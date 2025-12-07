//
//  QueueTests.swift
//  Tests
//
//  Created by Oleh Zimin on 08.12.2025.
//

import XCTest
@testable import DataStructuresAlgorithms

final class QueueTests: XCTestCase {
    func testEmptyQueue() {
        let queue = Queue<Int>()
        
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
        XCTAssertNil(queue.peek)
    }
    
    func testPopFromEmpty() {
        var queue = Queue<Int>()
        
        XCTAssertNil(queue.pop())
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)
    }
    
    func testOperations() {
        var queue = Queue<String>()
        
        queue.push("A")
        XCTAssertEqual(queue.pop(), "A")
        XCTAssertTrue(queue.isEmpty)
        
        queue.push("B")
        queue.push("C")
        XCTAssertEqual(queue.pop(), "B")
        queue.push("D")
        
        XCTAssertEqual(queue.pop(), "C")
        XCTAssertEqual(queue.pop(), "D")
        XCTAssertTrue(queue.isEmpty)
    }
    
    func testDescription() {
        var queue = Queue<Int>()
        queue.push(1)
        queue.push(2)
        queue.push(3)
        
        XCTAssertEqual(queue.description, "[1] <- [2] <- [3]")
    }
}
