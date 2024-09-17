//
//  IndicatorNormalization.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 17.09.2024.
//

import Foundation

//220. Нормализация показателей

func indicatorNormalization() {
    let _ = readLine()
    let canonical = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
    let count = Int(readLine()!)!
    var oldNums = [Int]()
    for _ in 1...count {
        oldNums.append(Int(readLine()!)!)
    }
    
    func firstCanonical(for num: Int) -> Int {
        var left = 0
        var right = canonical.count - 1
        var mid = (left + right) / 2
        var result = canonical[mid]
        while left <= right {
            let current = canonical[mid]
            if current - num > 0 {
                right = mid - 1
            } else {
                left = mid + 1
            }
            if abs(current - num) < abs(result - num) {
                result = current
            }
            mid = (left + right) / 2
        }
        
        return result
    }
    
    for num in oldNums {
        print(firstCanonical(for: num))
    }
}
