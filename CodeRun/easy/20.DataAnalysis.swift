//
//  20.DataAnalysis.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 20.09.2024.
//

import Foundation

//20. Анализ данных

func dataAnalysis() {
    let requestCount = Int(readLine()!)!
    var requests = [String]()
    var currentDB = [String: Int]()
    var responses = [String]()
    
    for _ in 1...requestCount {
        let request = readLine()!
        requests.append(request)
    }
    
    for req in requests {
        let request = req.split(separator: " ").map { String($0) }
        let requestType = request[0]
        
        
        switch requestType {
        case "+":
            currentDB[request[2], default: 0] += Int(request[1])!
        case "?":
            let pref = request[1]
            let response = currentDB.filter { $0.key.hasPrefix(pref)}.sorted(by: { p1, p2 in
                if p1.value > p2.value {
                    return true
                } else if p1.value == p2.value {
                    return p1.key < p2.key
                } else {
                    return false
                }
            }).first?.key
            if let response  {
                responses.append(response)
            } else {
                responses.append(pref)
            }
        default:
            continue
        }
    }
    
    print(responses.joined(separator: "\n"))
    
}
