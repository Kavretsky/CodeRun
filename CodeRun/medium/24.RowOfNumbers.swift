//
//  24.RowOfNumbers.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 23.09.2024.
//

import Foundation

//24. Числа в ряд

func rowOfNumbers() {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    var arrAfterDelete = [Int]()
    var lastDeleteNum = -1
    var result = 0
    for num in input {
        if num == lastDeleteNum {
            result += 1
            continue
        }
        if arrAfterDelete.count < 2 {
            arrAfterDelete.append(num)
            continue
        }
        let lastNum = arrAfterDelete.last!
        
        if num != lastNum {
            arrAfterDelete.append(num)
            continue
        }
        
        let lastLastNum = arrAfterDelete[arrAfterDelete.endIndex - 2]
        if lastLastNum == lastNum {
            arrAfterDelete.removeLast()
            arrAfterDelete.removeLast()
            lastDeleteNum = lastNum
            result += 3
        } else {
            arrAfterDelete.append(num)
        }
    }
    
    print(result)
}
