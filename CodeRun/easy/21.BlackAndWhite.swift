//
//  21.BlackAndWhite.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 21.09.2024.
//

import Foundation

//21. Черное и белое

func blackAndWhite() {
    let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = input1.first!
    let m = input1.last!
    
    var rows = [String]()
    
    for _ in 0..<n {
        let row = readLine()!
        rows.append(row)
    }
    var result = 0
    
    for row in rows {
        var isInside = false
        for char in row {
            switch char {
            case "/", "\\":
                if isInside {
                    result += 1
                }
                isInside.toggle()
            case ".":
                if isInside {
                    result += 1
                }
            default:
                continue
            }
        }
    }
    
    print(result)
    
}
