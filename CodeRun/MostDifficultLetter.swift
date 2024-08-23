//
//  MostDifficultLetter.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 23.08.2024.
//

import Foundation

// Самая сложная буква
func mostDifficultLetter() {
    let letterNumber = readLine()!.split(separator: " ").compactMap { Int(String($0))! }.first!
    let str = readLine()!.map { String($0) }
    let delayAr = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    
    var result = ""
    var maxDelay = 0
    var prevTime = 0
    
    for (index, ch) in str.enumerated() {
        let delay = delayAr[index] - prevTime
        if delay >= maxDelay {
            maxDelay = delay
            result = ch
        }
        prevTime = delayAr[index]
    }
    
    print(result)
}
