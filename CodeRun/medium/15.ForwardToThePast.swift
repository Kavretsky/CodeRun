//
//  ForwardToThePast.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 31.08.2024.
//

import Foundation

//15. Вперед в прошлое

func forwardToThePast() {
    let tryLimit = Int(readLine()!)!
    var left = stringToDate("01.01.1970")
    var right = stringToDate("31.12.2020")
    var targetCount = 0
    

    print("? 31.12.2020")
    fflush(stdout)
    
    if let response = readLine() {
        let parts = response.split(separator: " ")
        targetCount = Int(parts[1])! / 2 + 1
    }
    
    
    for _ in 1...tryLimit {
        let middle = Date(timeIntervalSince1970: (left.timeIntervalSince1970 + right.timeIntervalSince1970) / 2)
        let middleStr = dateToString(middle)
        
        print("? \(middleStr)")
        fflush(stdout)
        
        if let response = readLine() {
            let parts = response.split(separator: " ")
            let count = Int(parts[1])!
            
            if count == targetCount {
                print("! \(middleStr)")
                fflush(stdout)
                return
            } else if count < targetCount {
                left = Calendar.current.date(byAdding: .day, value: 1, to: middle)!
            } else {
                right = Calendar.current.date(byAdding: .day, value: -1, to: middle)!
            }
        }
    }
}

func stringToDate(_ date: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    return dateFormatter.date(from: date)!
}

func dateToString(_ date: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd.MM.yyyy"
    return dateFormatter.string(from: date)
}
