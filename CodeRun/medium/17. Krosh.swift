//
//  17. Krosh.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 25.09.2024.
//

import Foundation

// 17.Крош и строка

func krosh() {
    let n = Int(readLine()!)!
    let str = Array(readLine()!)
    guard n % 2 == 0 else {
        print("0")
        return
    }
    
    var result = 1
    var stack = [Character]()
    
    for ch in str {
        if let last = stack.last, last == ch {
            stack.removeLast()
        } else {
            stack.append(ch)
        }
    }
    
    result = stack.isEmpty ? 1 : 0
    print(result)
}
