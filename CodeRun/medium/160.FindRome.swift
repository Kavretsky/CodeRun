//
//  FindRome.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 28.08.2024.
//

import Foundation

//160. Все дороги ведут в Рим

func findRome() {
    let cityAndRoads = readLine()!.split(separator: " ").map { Int(String($0)) }
    let cities = cityAndRoads[0]!
    var roadsFrom = Set<Int>()
    var roadsTo = [Int: Set<Int>]()
    
    for _ in 0..<cityAndRoads[1]! {
        let cityAndCity = readLine()!.split(separator: " ").map{ Int(String($0)) }
        if cityAndCity[0] != cityAndCity[1] {
            roadsFrom.insert(cityAndCity[0]!)
            roadsTo[cityAndCity[1]!, default: []].insert(cityAndCity[0]!)
        }
    }
    var result = [Int]()
    for city in roadsTo.keys where roadsTo[city]!.count == cities - 1 && !roadsFrom.contains(city) {
        result.append(city)
    }
    if result.isEmpty {
        print("-1")
    } else {
        print(result.first!)
    }
}
