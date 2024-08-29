//
//  6.CallCenterJournal.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 29.08.2024.
//

import Foundation

//6 Журнал без дат
struct Time: Comparable {
    static func < (lhs: Time, rhs: Time) -> Bool {
        if lhs.hours < rhs.hours {
            return true
        } else if lhs.hours > rhs.hours {
            return false
        }
        if lhs.minutes < rhs.minutes {
            return true
        } else if lhs.minutes > rhs.minutes {
            return false
        }
        if lhs.second < rhs.second {
            return true
        } else {
            return false
        }
    }
    
    var hours: Int
    var minutes: Int
    var second: Int
    
    
}

func callCenterJournal() {
    let dataCount = Int(readLine()!)!
    var dataArray = [String]()
    
    for _ in 1...dataCount {
        let data = readLine()!
        dataArray.append(data)
    }
    
    var lastTime: Time?
    var numberOfDays = 0
    
    for date in dataArray {
        let arr = date.split(separator: ":").map { Int(String($0))! }
        let time = Time(hours: arr[0], minutes: arr[1], second: arr[2])
        if lastTime != nil {
            if time < lastTime! {
                numberOfDays += 1
            }
            lastTime = time
        } else {
            lastTime = time
            numberOfDays = 1
        }
    }
    
    
    print(numberOfDays)
}
