//
//  237. Managers.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 20.09.2024.
//

import Foundation

//237. Руководители

func managers() {
    let num = Int(readLine()!)!
    let managers = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    var directorIndex = 0
    var managerDic = [Int: [Int]]()
    
    for (index, manager) in managers.enumerated() {
        if manager == 0 {
            directorIndex = index
        } else {
            managerDic[manager - 1, default: []].append(index)
        }
    }
    
    var result = Array(repeating: 0, count: num)
    
    func dfs(_ index: Int, _ depth: Int) {
        let lowManagers = managerDic[index, default: []]
        for manager in lowManagers {
            result[manager] = depth + 1
            dfs(manager, depth + 1)
        }
    }
    dfs(directorIndex, 0)
    print(result.map { String($0) }.joined(separator: " "))
    
}
