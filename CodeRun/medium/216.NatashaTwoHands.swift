//
//  216.NatashaTwoHands.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 17.09.2024.
//

import Foundation

//216. Наташа-рукодельница

func natashaTwoHands() {
    let num = Int(readLine()!)!
    let letters = readLine()!.map { String($0) }
    guard letters.count > 1 else {
        print("1")
        return
    }
    var result = num
    let usedLetters: Set<String> = Set(letters.filter({ $0 != "#" }))
    guard usedLetters.count > 1 else {
        print("1")
        return
    }
    
    for k in 2..<num {
        var leftIndex = k
        var rightIndex = k + k
        var pattern = letters[0..<k].map { String($0) }
        
        while leftIndex < num {
            rightIndex = min(rightIndex, letters.count)
            let subStr = letters[leftIndex..<rightIndex].map { String($0) }
            if isSame(pattern, s2: subStr) {
                if pattern.contains("#") {
                    pattern = subStr
                }
                leftIndex = rightIndex
                rightIndex += k
            } else {
                break
            }
        }
        if leftIndex >= num {
            result = min(k, result)
            break
        }
        
    }
    print(result)
}

func isSame(_ s1: [String], s2: [String]) -> Bool {
    for index in 0..<s2.count {
        if s1[index] == s2[index] || s2[index] == "#" || s1[index] == "#" {
            continue
        } else {
            return false
        }
    }
    return true
}
