//
//  212.addMinus.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 27.08.2024.
//

import Foundation

// 212. Добавить минусы
// Pass closed tests: 18/35
// no idea about wrong test-cases

func addMinus() {
    let numString = readLine()!
    let numAr = Array(numString)
    var currentSet = Set<String>()
    var resultArr = [String]()
    var currentNUm = ""
    for num in numAr.reversed() {
        currentNUm += String(num)
        var adaptiveNum = currentNUm.filter({ $0 != "0" }).isEmpty ? "0" : currentNUm
        if let lastNotZero = adaptiveNum.lastIndex(where: { $0 != "0" }) {
            let newIndex = adaptiveNum.index(lastNotZero, offsetBy: 1)
            adaptiveNum = String(adaptiveNum.prefix(upTo: newIndex))
        }
        if !currentSet.contains(adaptiveNum) {
            currentSet.insert(currentNUm)
            resultArr.append(currentNUm)
            currentNUm = ""
        }
    }
    var addedNumbers = 1
    while !currentNUm.isEmpty {
        resultArr[resultArr.count - 1] += String(currentNUm.removeFirst())
        guard !currentNUm.isEmpty else { break }
        var adaptiveNum = currentNUm.filter({ $0 != "0" }).isEmpty ? "0" : currentNUm
        if let lastNotZero = adaptiveNum.lastIndex(where: { $0 != "0" }) {
            let newIndex = adaptiveNum.index(lastNotZero, offsetBy: 1)
            adaptiveNum = String(adaptiveNum.prefix(upTo: newIndex))
        }
        let lastNumberBeforeAdd = String(resultArr[resultArr.count - 1].dropLast(addedNumbers))
        if !currentSet.contains(adaptiveNum) && !currentSet.contains(lastNumberBeforeAdd) {
            currentSet.insert(currentNUm)
            resultArr.append(currentNUm)
            currentNUm = ""
        }
        addedNumbers += 1
    }
    let resultString = resultArr.joined(separator: "-").reversed().reduce(into: String()) { partialResult, strEl in
        partialResult += String(strEl)
    }
    print(resultString)
}
