//
//  23.ShortRoute.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 22.09.2024.
//

import Foundation

//23. Сокращение маршрута

func shortRoute() {
    var inputArr = [String]()
    
    while true {
        let input = readLine() ?? ""
        if input.isEmpty {
            break
        } else {
            inputArr.append(input)
        }
    }
    
    var result = [String]()
    for index in 0..<inputArr.count {
        var lastInput = result.last?.split(separator: " ").map { String($0) }
        let currentInput = inputArr[index].split(separator: " ").map { String($0) }
        guard var lastInput, !lastInput.isEmpty else {
            result.append(inputArr[index])
            continue
        }
        if lastInput[1] == "0" {
            result.removeLast()
            result.append(inputArr[index])
            continue
        }
        if lastInput[0] == opositeDirection(currentInput[0]) {
            if Int(lastInput[1])! > Int(currentInput[1])! {
                let diff = Int(lastInput[1])! - Int(currentInput[1])!
                lastInput[1] = String(diff)
                result[result.endIndex - 1] = lastInput.joined(separator: " ")

            } else if Int(lastInput[1])! < Int(currentInput[1])! {
                lastInput[0] = currentInput[0]
                lastInput[1] = String(Int(currentInput[1])! - Int(lastInput[1])!)
                result[result.endIndex - 1] = lastInput.joined(separator: " ")
            } else {
                result.removeLast()
            }
        } else if lastInput[0] == currentInput[0] {
            lastInput[1] = String(Int(lastInput[1])! + Int(currentInput[1])!)
            result[result.endIndex - 1] = lastInput.joined(separator: " ")
        } else {
            result.append(inputArr[index])
        }
    }
    
    
    
    
    func opositeDirection(_ direction: String) -> String {
        switch direction {
        case "LEFT":
            return "RIGHT"
        case "RIGHT":
            return "LEFT"
        case "TOP":
            return "BOTTOM"
        case "BOTTOM":
            return "TOP"
        default:
            return ""
        }
    }
    
    for line in result {
        print(line)
    }
}
