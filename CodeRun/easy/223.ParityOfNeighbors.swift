//
//  ParityOfNeighbors.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 28.08.2024.
//

import Foundation


//223. Чётность соседей
// passed 10/81 tests

func parityOfNeighbors() {
    let _ = Int(readLine()!)!
    let nums = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
    guard nums.count > 1 else {
        print("0")
        print(nums.first!)
        return
    }
    let numDic = Dictionary(grouping: nums) { element in
        oddOrEven(element)
    }
    guard abs(numDic["Odd", default: []].count - numDic["Even", default: []].count) <= 1
    else {
        print("-1")
        return
    }
    let mode: String
    if numDic["Odd", default: []].count - numDic["Even", default: []].count == 0 {
        mode = "0"
    } else if numDic["Odd", default: []].count > numDic["Even", default: []].count {
        mode = "Odd"
    } else {
        mode = "Even"
    }
    
    var resultArr = [Int]()
    
    if mode == "0" {
        var firstArr = numDic.first(where: { $0.value.contains(where: { $0 == nums.first! })})!.value
        var secondArr = numDic.first(where: { !$0.value.contains(where: { $0 == nums.first! })})!.value
        while !firstArr.isEmpty {
            let firstNum = firstArr.first!
            if nums[resultArr.count] != firstNum, let rigthIndex = firstArr.firstIndex(of: nums[resultArr.count]) {
                resultArr.append(firstArr.remove(at: rigthIndex))
            } else {
                resultArr.append(firstArr.removeFirst())
            }
            
            let secondNum = secondArr.first!
            if nums[resultArr.count] != secondNum, let rigthIndex = secondArr.firstIndex(of: nums[resultArr.count]) {
                resultArr.append(secondArr.remove(at: rigthIndex))
            } else {
                resultArr.append(secondArr.removeFirst())
            }
        }
    } else if mode == "Even" {
        var firstArr = numDic["Even", default: []]
        var secondArr = numDic["Odd", default: []]
        while firstArr.count > 1 {
            let firstNum = firstArr.first!
            if nums[resultArr.count] != firstNum, let rigthIndex = firstArr.firstIndex(of: nums[resultArr.count]) {
                resultArr.append(firstArr.remove(at: rigthIndex))
            } else {
                resultArr.append(firstArr.removeFirst())
            }
            
            let secondNum = secondArr.first!
            if nums[resultArr.count] != secondNum, let rigthIndex = secondArr.firstIndex(of: nums[resultArr.count]) {
                resultArr.append(secondArr.remove(at: rigthIndex))
            } else {
                resultArr.append(secondArr.removeFirst())
            }
        }
        resultArr.append(firstArr.first!)
    } else {
        var firstArr = numDic["Odd", default: []]
        var secondArr = numDic["Even", default: []]
        while firstArr.count > 1 {
            let firstNum = firstArr.first!
            if nums[resultArr.count] != firstNum, let rigthIndex = firstArr.firstIndex(of: nums[resultArr.count]) {
                resultArr.append(firstArr.remove(at: rigthIndex))
            } else {
                resultArr.append(firstArr.removeFirst())
            }
            
            let secondNum = secondArr.first!
            if nums[resultArr.count] != secondNum, let rigthIndex = secondArr.firstIndex(of: nums[resultArr.count]) {
                resultArr.append(secondArr.remove(at: rigthIndex))
            } else {
                resultArr.append(secondArr.removeFirst())
            }
        }
        resultArr.append(firstArr.first!)
    }
    var differents = 0
    var differenceIndices = [Int]()
    for index in 0..<nums.count {
        if nums[index] != resultArr[index] {
            differents += 1
            differenceIndices.append(index)
        }
    }
    
    for i in 0..<resultArr.count - 1 {
        for j in i + 1..<resultArr.count {
            if resultArr[i] % 2 == resultArr[j] % 2, resultArr[i] != resultArr[j] {
                if nums[i] == resultArr[j] || nums[j] == resultArr[i] {
                    resultArr.swapAt(i, j)
                    differents -= 1
                }
            }
        }
    }
    
    print(differents)
    print(resultArr.map { String($0)}.joined(separator: " "))
}

func oddOrEven(_ num: Int) -> String {
    num % 2 == 1 ? "Odd" : "Even"
}
