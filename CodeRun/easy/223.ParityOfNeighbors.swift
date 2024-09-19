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
    var odds = [Int]()
    var evens = [Int]()
    
    for num in nums {
        if isOdd(num) {
            odds.append(num)
        } else {
            evens.append(num)
        }
    }
    
    var swapsCount = 0
    var swappedIndices: [Int] = []
     
    guard abs(odds.count - evens.count) <= 1
    else {
        print("-1")
        return
    }
    
    func constructArr(_ arr1: [Int], arr2: [Int]) -> [Int] {
        var result = [Int]()
        var i = 0
        var j = 0
        var isI = true
        for index in 0..<nums.count {
            if isI {
                result.append(arr1[i])
                i += 1
            } else {
                result.append(arr2[j])
                j += 1
            }
            isI.toggle()
        }
        return result
    }
    
    func searchSwaps(for arr: [Int]) -> (Int, [Int]) {
        var count = 0
        var indices: [Int] = []
        var skippedOdd = [Int]()
        var skippedEven: [Int] = []
        
        for index in 0..<arr.count {
            switch (isOdd(arr[index]), isOdd(nums[index])) {
            case (true, true):
                indices.append(nums[index])
                if nums[index] != arr[index] {
                    skippedOdd.append(arr[index])
                }
            case (false, false):
                indices.append(nums[index])
                if nums[index] != arr[index] {
                    skippedEven.append(arr[index])
                }
            case (true, false):
                count += 1
                if skippedOdd.isEmpty {
                    indices.append(arr[index])
                } else {
                    indices.append(skippedOdd.removeLast())
                }
            case (false, true):
                count += 1
                if skippedEven.isEmpty {
                    indices.append(arr[index])
                } else {
                    indices.append(skippedEven.removeLast())
                }
            }
        }
        return (count, indices)
    }
    
    if odds.count > evens.count {
        let result = constructArr(odds, arr2: evens)
        (swapsCount, swappedIndices) = searchSwaps(for: result)
        
    } else if odds.count < evens.count {
        let result = constructArr(evens, arr2: odds)
        (swapsCount, swappedIndices) = searchSwaps(for: result)
        
    } else {
        let arr1 = constructArr(odds, arr2: evens)
        let (swapsRes, res) = searchSwaps(for: arr1)
        let arr2 = constructArr(evens, arr2: odds)
        let (swapsRes2, res2) = searchSwaps(for: arr2)
        if swapsRes < swapsRes2 {
            swapsCount = swapsRes
            swappedIndices = res
        } else {
            swapsCount = swapsRes2
            swappedIndices = res2
        }
    }
    
    print(swapsCount)
    print(swappedIndices.map { String($0)}.joined(separator: " "))
    
}

func isOdd(_ num: Int) -> Bool {
    num % 2 == 1
}
