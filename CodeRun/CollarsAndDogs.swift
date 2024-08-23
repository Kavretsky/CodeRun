//
//  CollarsAndDogs.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 23.08.2024.
//

import Foundation

// Ошейники и песики
func collarsAndDogs() {
    let dogNum = readLine()!.split(separator: " ").compactMap { Int(String($0))! }.first!
    let dogRad = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    let colRad = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    
    var resultNum = -1
    var resultNegative = Int.max
    
    for houseIndex in 0..<dogNum {
        var currentNegative = 0
        for collarIndex in 0..<dogNum {
            let dogIndex = (collarIndex + houseIndex) % dogNum
            let dogNeck = dogRad[dogIndex]
            let col = colRad[collarIndex]
            if col < dogNeck {
                continue
            } else
            if col - dogNeck <= 100 {
                currentNegative += (col - dogNeck) / 2
            } else {
                currentNegative += 30
            }
        }
        if resultNegative > currentNegative {
            resultNegative = currentNegative
            resultNum = houseIndex + 1
        }
    }
    
    print(resultNum, resultNegative)
}
