//
//  BugInDB.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 31.08.2024.
//

import Foundation

//14. Баг в БД

func bugInDB() {
    var strings = [String]()
    while let string = readLine() {
        if string == "" {
            break
        }
        strings.append(string)
    }
    var result = Array(repeating: "", count: strings.count)
    
    for str in strings {
        let arr = Array(str)
        var num = ""
        var s = ""
        for ch in arr {
            if ch.isNumber {
                num += String(ch)
            } else {
                s += String(ch)
            }
        }
        result[Int(num)! - 1] = s
    }
    result.forEach { print($0) }
}
