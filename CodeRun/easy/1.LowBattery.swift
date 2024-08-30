//
//  LowBattery.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 29.08.2024.
//

import Foundation

//1 Села батарейка

func lowBattery() {
    _ = Int(readLine()!)
    let appUsage = readLine()!.split(separator: " ").map { Int($0)! }.reduce(0, +)
    
    print(100 / appUsage)
}
