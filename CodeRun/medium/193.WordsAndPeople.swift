//
//  193.WordsAndPeople.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 19.09.2024.
//

import Foundation

//193. Слова, в которые играют люди

func wordsAndPeople() {
    let k = Int(readLine()!)!
    let str = readLine()!.map { String($0) }
    var memo = [String: Bool]()
    
    var maximum = str.count / k
    func isPalindrome(_ start: Int, _ end: Int) -> Bool {
        
        if memo["\(start)-\(end)"] != nil { return memo["\(start)-\(end)"]! }
        var left = start
        var right = end
        while left < right {
            if str[left] != str[right] {
                memo["\(start)-\(end)"] = false
                return false
            }
            left += 1
            right -= 1
            
        }
        memo["\(start)-\(end)"] = true
        return memo["\(start)-\(end)"]!
    }
    
    func isNumPalindromeWithMinLength(_ length: Int) -> Bool {
        var left = 0
        var result = 0
        while left < str.count - length + 1 {
            let right = left + length - 1
            
            if isPalindrome(left, right) {
                result += 1
                left = right + 1
            } else {
                left += 1
            }
            if result >= k {
                return true
            }
        }
        
        return false
        
    }
    var result = 1
    while maximum > 1 {
        if isNumPalindromeWithMinLength(maximum) {
            result = maximum
            break
        } else {
            maximum -= 1
        }
    }
    
    print(result)
}
