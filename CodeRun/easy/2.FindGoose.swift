//
//  2.FindGoose.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 29.08.2024.
//

import Foundation

//2 Запускайте Гуся

func findGoose() {
    let articlesAndK = readLine()!.split(separator: " ").map { Int(String($0)) }
    let articlesNum = articlesAndK[0]!
    let numberOfRepetition = articlesAndK[1]!
    typealias site = String
    typealias word = String
    typealias count = Int
    var store = [site:[word:count]]()
    
    for _ in 1...articlesNum {
        let site = readLine()!
        let words = readLine()!.split(separator: " ").map { String($0) }
        for word in words {
            store[site, default: [:]][word, default: 0] += 1
        }
    }
    
    var removed = [String]()
    
    for site in store.keys {
        if store[site]!["goose", default: 0] >= numberOfRepetition {
            removed.append(site)
        }
    }
    removed.sort(by: < )
    print(removed.count)
    for site in removed {
        print(site)
    }
}
