//
//  212.addMinus.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 27.08.2024.
//

import Foundation

// 212. Добавить минусы

func isValidPartition(_ parts: [String]) -> Bool {
    var seen: Set<String> = []
    for part in parts {
        if (part.hasPrefix("0") && part != "0") || seen.contains(part) {
            return false
        }
        seen.insert(part)
    }
    return true
}

func addMinus(_ n: String) -> String {
    let length = n.count
    var bestPartition: [String] = []
    
    for mask in 0..<(1 << (length - 1)) {
        var parts: [String] = []
        var currentPart = ""
        
        for (i, char) in n.enumerated() {
            currentPart.append(char)

            if (mask & (1 << i)) != 0 || i == length - 1 {
                parts.append(currentPart)
                currentPart = ""
            }
        }
        
        if isValidPartition(parts) && parts.count > bestPartition.count {
            bestPartition = parts
        }
    }
    
    return bestPartition.joined(separator: "-")
}
