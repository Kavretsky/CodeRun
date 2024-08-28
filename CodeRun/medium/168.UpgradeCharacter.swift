//
//  UpgradeCharacter.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 28.08.2024.
//

import Foundation

//168. Прокачай героя
func upgradeCharacter() {
    let _ = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var minPositive: Int?

    var negativeNumber = [Int]()
    
    for number in numbers {

        if number >= 0 {
            minPositive = min(number, minPositive ?? Int.max)
        }
        if number < 0 {
            negativeNumber.append(number)
        }
    }
    
    if negativeNumber.count % 2 == 1 {
        print(negativeNumber.max()!)
        return
    } else {
        if minPositive != nil {
            print(minPositive!)
        } else {
            print(negativeNumber.min()!)
        }
    }
}
