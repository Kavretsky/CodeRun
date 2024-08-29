//
//  7. ColorfulLife.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 29.08.2024.
//

import Foundation

//7 Жизнь в красках

func colorfulLife() {
    let input1 = readLine()!.split(separator: " ").map { Int(String($0)) }
    let colors = input1[0]!
    let t = input1[1]!
    var intervals = [(start: Int, end: Int)]()
    for _ in 1...colors {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let start = input[0]
        let end = input[1]
        let duration = input[2]
        intervals.append((end, start + duration - 1))
    }
    intervals.sort(by: { $0.start < $1.start })
    
    var curentDay = 1
    for interval in intervals {
        if interval.start > curentDay {
            print("No")
            return
        }
        curentDay = max(curentDay, interval.end)
        if curentDay >= t {
            print("Yes")
            return
        }
    }
    
    print("No")
}
