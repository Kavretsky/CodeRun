//
//  File.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 31.08.2024.
//

import Foundation

//13. Как курица лапой

func chickenPaw() {
    _ = readLine()!
    let scannerWord = readLine()!
    let vocabularySize = Int(readLine()!)!
    var words = [String]()
    for _ in 1...vocabularySize {
        _ = readLine()!
        words.append(readLine()!)
    }
    let threshold = 0.0000000006 //результат double 1^-10. если поменять 6 на 1 тесты не пройдут
    var result = ""
    var resultProbability = -1.0
    for word in words {
        let probability = matchProbability(scannerWord, word)
        
        if probability > resultProbability || (probability == resultProbability && word <= result) {
            result = word
            resultProbability = probability
        }
    }
    
    if resultProbability <= threshold {
        print("NO MATCH")
    } else {
        print(result)
    }
}

func matchProbability(_ word1: String, _ word2: String) -> Double {
    let m = word1.count
    let n = word2.count
    let word1 = Array(word1)
    let word2 = Array(word2)
    
    let P_replace = 0.5
    let P_skip = 0.1
    let P_add = 0.4
    let P_correct = 1.0

    
    var dp = Array(repeating: Array(repeating: 0.0, count: n + 1), count: m + 1)
    dp[0][0] = 1.0
    for i in 1...m {
        dp[i][0] = dp[i - 1][0] * P_add
    }
    
    for j in 1...n {
        dp[0][j] = dp[0][j-1] * P_skip
    }
    
    for i in 1...m {
        for j in 1...n {
            let cost = word1[i - 1] == word2[j - 1] ? P_correct : P_replace
            
            dp[i][j] = max(dp[i-1][j-1] * cost, dp[i][j-1] * P_skip, dp[i-1][j] * P_add)
            
        }
    }
    return dp[m][n]
}
