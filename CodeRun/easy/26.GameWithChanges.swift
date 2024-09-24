//
//  26.GameWithChanges.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 24.09.2024.
//

import Foundation

//26. Игра с заменами

func gameWithChanges() {
    let count = Int(readLine()!)!
    var beforeArr = [String]()
    var afterArr = [String]()
    for _ in 1...count {
        let str1 = readLine()!
        let str2 = readLine()!
        beforeArr.append(str1)
        afterArr.append(str2)
    }
    var result = [String]()
    for index in 0..<count {
        let before = Array(beforeArr[index])
        let after = Array(afterArr[index])
        var beforeDict = [Character: Character]()
        var afterDict = [Character: Character]()
        var currentResult = "YES"
        for index in 0..<before.count {
            let beforeCh = before[index]
            let afterCh = after[index]
            if beforeDict[beforeCh] == nil && afterDict[afterCh] == nil {
                beforeDict[beforeCh] = afterCh
                afterDict[afterCh] = beforeCh
            } else if beforeDict[beforeCh] != afterCh || afterDict[afterCh] != beforeCh {
                currentResult = "NO"
                break
            }
            
        }
        
        result.append(currentResult)
    }
    
    for res in result {
        print(res)
    }
    
}
