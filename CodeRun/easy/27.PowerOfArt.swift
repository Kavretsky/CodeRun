//
//  PowerOfArt.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 24.09.2024.
//

import Foundation

//27. Сила искусства

func powerOfArt() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input[0]
    let m = input[1]
    
    let marks = readLine()!.split(separator: " ").map { Int(String($0))! }.filter { $0 != 0 }
    var result = 0
    var index = 0
    
    var sums = [Int]()
    
    for index in 0..<marks.count {
        let last = sums.last ?? 0
        sums.append(last + marks[index])

    }

    while index < marks.count {
        let mark = marks[index]
        result += mark * mark
        if index == marks.count - 1 { break }
        let localSum = sums[min(index + mark, marks.count - 1)] - sums[index]

        result += localSum
        index += 1
    }
    
    print(result)
    
}


