//
//  Archiving.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 18.09.2024.
//

import Foundation

//242. Архивирование

func archiving(_ str: String) -> String {
    let str = str.map { String($0) }
    var result = [String]()
    var existing = Set<String>()
    
    var current: String = ""
    
    for c in str {
        current.append(c)
        if existing.contains(current) {
            continue
        } else {
            existing.insert(current)
            result.append(current)
            current = ""
        }
    }
    if !current.isEmpty {
        result.append(current)
    }
    return result.joined(separator: " ")
}

func runArchiving() {
    let input = readLine()!
    let result = archiving(input)
    print(result)
}

func testArchiving() {
    assert(archiving("11001110011") == "1 10 0 11 100 11")
    assert(archiving("1111111") == "1 11 111 1")
    assert(archiving("10101010111110000101010010") == "1 0 10 101 01 11 110 00 010 1010 010")
    assert(archiving("000001111110000001111110000110") == "0 00 001 1 11 110 000 0011 111 10 0001 10")
}
