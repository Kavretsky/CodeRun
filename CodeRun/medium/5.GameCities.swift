//
//  5.GameCities.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 29.08.2024.
//

import Foundation

//5 Игра в города

func gameCities() {
    var input1 = readLine()!
    if let dotIndex = input1.firstIndex(of: ".") {
        input1.remove(at: dotIndex)
    }
    let array1 = input1.split(separator: ", ").map { String($0) }
    var input2 = readLine()!
    if let dotIndex = input2.firstIndex(of: ".") {
        input2.remove(at: dotIndex)
    }
    let array2 = input2.split(separator: ", ").map { String($0) }
    var set1 = Set<Set<String>>()
    
    for city in array1 {
        let cityAndCountry = city.split(separator: " ").map{ String($0) }
        let set: Set<String> = [cityAndCountry[0], cityAndCountry[1]]
        set1.insert(set)
    }
    
    for city in array2 {
        let cityAndCountry = city.split(separator: " ").map{ String($0) }
        let set: Set<String> = [cityAndCountry[0], cityAndCountry[1]]
        if !set1.contains(set) {
            print("NO")
            return
        }
    }
    
    print("YES")
}
