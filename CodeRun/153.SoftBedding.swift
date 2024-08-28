//
//  SoftBedding.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 23.08.2024.
//

import Foundation

// Мягкие подстилки
func softBedding() {
    let widthAndBedCount = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    let width = widthAndBedCount[0]
    let beds = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    var result = 1
    var rightIndex = beds.reduce(0, +) / width
    var leftIndex = 1
    var current = 0
    while rightIndex >= leftIndex {
        current = (rightIndex + leftIndex) / 2
        var arr = [0]
        for bed in beds {
            if arr[arr.count - 1] < current {
                arr[arr.count - 1] += bed
            } else {
                arr.append(bed)
            }
        }
        if arr.last! < current {
            arr.removeLast()
        }
        if arr.count < width {
            rightIndex = current - 1
        } else {
            result = max(result, current)
            leftIndex = current + 1
        }
    }
    
    print(result)
}
