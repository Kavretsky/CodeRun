//
//  25.Hokku.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 23.09.2024.
//

import Foundation

//25. Хокку на английском

func hokku() {
    var input = Array(readLine()!)
    let target1 = Array("Yandex")
    let target2 = Array("Cup")
    guard input.count > 9 else {
        print("YandexCup")
        return
    }
    
    var changesForYandex = Array(repeating: target1.count, count: input.count)
    var changesForCup = Array(repeating: target2.count, count: input.count)
    
    for i in 0...(input.count - target1.count - target2.count) {
        var currentChanges = 0
        
        for index in 0..<target1.count {
            let currentChar = input[i + index]
            let targetChar = target1[index]
            if currentChar != targetChar {
                currentChanges += 1
            }
        }
        changesForYandex[i] = currentChanges
    }
    
    for i in target1.count...(input.count - target2.count) {
        var currentChanges = 0
        
        for (index, targetChar) in target2.enumerated() {
            let currentChar = input[i + index]
            if currentChar != targetChar {
                currentChanges += 1
            }
        }
        changesForCup[i] = currentChanges
    }
    
    var bestYandexIndex = -1
    var bestCupIndex = -1
    var bestChanges = Int.max
    
    var minYandexChanges = Int.max
    var minYandexIndex = -1
    
    for i in 0...(input.count - target1.count) {
        if changesForYandex[i] < minYandexChanges {
            minYandexChanges = changesForYandex[i]
            minYandexIndex = i
        }
        
        if i + target1.count <= input.count - target2.count {
            let cupIndex = i + target1.count
            let totalChanges = minYandexChanges + changesForCup[cupIndex]
            if totalChanges < bestChanges {
                bestChanges = totalChanges
                bestYandexIndex = minYandexIndex
                bestCupIndex = cupIndex
            }
        }
    }
    
    
    
    for (index, char) in target1.enumerated() {
        input[bestYandexIndex + index] = char
    }
    
    for (index, char) in target2.enumerated() {
        input[bestCupIndex + index] = char
    }
    
    print(String(input))
    
}
//ffffffxCupdexjKCupkl
//ffffffxCupdexjKkl
//[6, 5, 6, 6, 6, 6, 6, 3, 6, 6, 6, 6, 6, 6, 6, 6]
//[3, 3, 3, 3, 3, 3, 3, 0, 3, 3, 3, 3, 3, 3, 3, 3]

//[6, 5, 4, 6, 6, 6, 6, 3, 6, 6, 6, 6, 6, 6, 6, 6]
//[3, 3, 3, 3, 3, 3, 3, 0, 3, 3, 3, 3, 0, 3, 3, 3]
//gggggganupupgg
