//
//  IndexOfChord.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 30.08.2024.
//

import Foundation

//11.Индекс септаккорда
func chordIndex() {
    _ = Int(readLine()!)
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    var squares = [Int]()
    var n = 1
    while n * n <= 100_000 {
        squares.append(n * n)
        n += 1
    }
    
    var leftIndex = 0
    var rightIndex = 315
    var result = 0
    while leftIndex <= rightIndex {
        let mid = (rightIndex + leftIndex) / 2
        
        let border = squares[mid]
        if arr.filter( { $0 >= border }).count >= mid + 1 {
            result = max(mid + 1, result)
            leftIndex = mid + 1
        } else {
            rightIndex = mid - 1
        }
    }
    
    print(result)
}
