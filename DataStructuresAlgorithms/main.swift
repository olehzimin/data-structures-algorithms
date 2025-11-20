//
//  main.swift
//  DataStructuresAlgorithms
//
//  Created by Oleh Zimin on 20.11.2025.
//

import Foundation

var linkedList = LinkedList<Int>()

linkedList.add(1)
linkedList.add(2)
linkedList.add(5)

let searchOut = linkedList.search(for: 6)

print(searchOut)
