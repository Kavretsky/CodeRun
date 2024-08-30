//
//  11.KroshJump.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 30.08.2024.
//

import Foundation

// 11. Крош и минимальный путь

func canReachWithLevel(_ a: [Int], n: Int, k: Int, level: Int) -> Bool {
    
    var index = 1
    
    while index <= n {
        if index == n {
            return true
        }
        var goodStep = 0
        
        for jump in 1...k {
            let nextStep = index + jump
            if nextStep > n {
                continue
            }
            if a[nextStep] <= level {
                goodStep = nextStep
            }
        }
        if goodStep == 0 {
            return false
        }
        index = goodStep
    }
    
    return false
}

func findMinimumLevel(a: [Int], n: Int, k: Int) -> Int {
    var low = max(a[1], a[n])
    var high = a.max()!
    
    var answer = high
    
    while low <= high {
        let mid = (low + high) / 2
        
        if canReachWithLevel(a, n: n, k: k, level: mid) {
            answer = mid
            high = mid - 1
        } else {
            low = mid + 1
        }
    }
    
    return answer
}

func kroshJump() {
    let nk = readLine()!.split(separator: " ").map { Int($0)! }
    let n = nk[0]
    let k = nk[1]
    let a = [0] + readLine()!.split(separator: " ").map { Int($0)! }

    let result = findMinimumLevel(a: a, n: n, k: k)
    print(result)
}

