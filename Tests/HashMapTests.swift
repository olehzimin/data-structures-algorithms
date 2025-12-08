//
//  HashMapTests.swift
//  Tests
//
//  Created by Oleh Zimin on 08.12.2025.
//

import XCTest
@testable import DataStructuresAlgorithms

final class HashMapTests: XCTestCase {
    func testEmptyHashMap() {
        let map = HashMap<String, Int>()
        
        XCTAssertTrue(map.isEmpty)
        XCTAssertEqual(map.count, 0)
        XCTAssertNil(map.value(for: "value"))
    }
    
    func testAddOperation() {
        var map = HashMap<String, Int>()
        
        map.add(value: 2, for: "Oleh")
        map.add(value: 5, for: "Anna")
        
        XCTAssertFalse(map.isEmpty)
        XCTAssertEqual(map.count, 2)
        XCTAssertEqual(map.value(for: "Oleh"), 2)
        XCTAssertEqual(map.value(for: "Anna"), 5)
        XCTAssertNil(map.value(for: "Bob"))
    }
    
    func testRemoveOperation() {
        var map = HashMap<String, Int>()
        
        map.add(value: 2, for: "Oleh")
        map.add(value: 5, for: "Anna")
        map.add(value: 3, for: "Bob")
        
        XCTAssertEqual(map.count, 3)
        
        map.remove(for: "Anna")
        XCTAssertEqual(map.count, 2)
        XCTAssertNil(map.value(for: "Anna"))
        XCTAssertEqual(map.value(for: "Oleh"), 2)
        XCTAssertEqual(map.value(for: "Bob"), 3)
        
        map.remove(for: "value")
        XCTAssertEqual(map.count, 2)
    }
    
    func testManyInserts() {
        var map = HashMap<Int, String>()
        let total = 1000
        
        for i in 0..<total {
            map.add(value: "value \(i)", for: i)
        }
        
        XCTAssertEqual(map.count, total)
        
        for i in 0..<total {
            XCTAssertEqual(map.value(for: i), "value \(i)")
        }
    }
    
    func testSubscript() {
        var map: HashMap = ["Oleh": 2, "Anna": 5]
        
        XCTAssertEqual(map.count, 2)
        XCTAssertEqual(map["Oleh"], 2)
        XCTAssertEqual(map["Anna"], 5)
        XCTAssertNil(map["Kate"])
        
        map["Oleh"] = 10
        XCTAssertEqual(map["Oleh"], 10)
        
        map["Anna"] = nil
        XCTAssertNil(map["Anna"])
        XCTAssertEqual(map.count, 1)
    }
}
