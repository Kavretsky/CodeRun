//
//  LuckyTicket.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 29.08.2024.
//

import Foundation

// 3 Суеверный коллекционер

func firstLuckyBox() {
    var number = Int(readLine()!)!
    
    while number < 1000000 {
        if isLucky(number) {
            print(number)
            return
        }
        number += 1
    }
    
}

func isLucky(_ num: Int) -> Bool {
    let arr = String(num).map { Int(String($0))! }
    return arr[0] + arr[1] + arr[2] == arr[3] + arr[4] + arr[5]
}
