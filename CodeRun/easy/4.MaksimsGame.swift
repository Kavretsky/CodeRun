//
//  4.MaksimsGame.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 29.08.2024.
//

import Foundation

//4 Игра макисма

func passGame() {
    let numberOfEnemy = Int(readLine()!)
    let enemies = readLine()!.split(separator: " ").map { Int(String($0))! }
    var sortedEnemies = enemies.sorted(by: <)
    var dictIndices = [Int:[Int]]()
    for (index, enemy) in enemies.enumerated() {
        dictIndices[enemy, default: []].append(index + 1)
    }
    var numberOfPenalty = 0
    var mylevel = 1
    for enemy in sortedEnemies {
        if enemy > mylevel {
            print("Impossible")
            return
        } else {
            if enemy * 2 > mylevel {
                numberOfPenalty += 1
                
            }
            mylevel += 1
            if numberOfPenalty == 3 {
                mylevel -= 1
                numberOfPenalty = 0
            }
        }
    }
    var resultArr = [Int]()
    for enemy in sortedEnemies {
        resultArr.append(contentsOf: dictIndices[enemy]!)
    }
    print("Possible")
    var resultWithOutDublicates = [Int]()
    var set = Set<Int>()
    for result in resultArr {
        if set.contains(result) {
            continue
        } else {
            resultWithOutDublicates.append(result)
            set.insert(result)
        }
    }
    print(resultWithOutDublicates.map { String($0)}.joined(separator: " "))
}
