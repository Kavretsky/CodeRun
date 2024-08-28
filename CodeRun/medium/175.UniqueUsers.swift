//
//  175.UniqueUsers.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 28.08.2024.
//

import Foundation

//175. Уникальные пользователи

func uniqueUsers() {
    let numberOfElements = Int(readLine()!)!
    var emailArray = [String]()
    for _ in 1...numberOfElements {
        emailArray.append(readLine()!)
    }
    
    var unique = Set<String>()
    
    for email in emailArray {
        var login = ""
        var domain = ""
        var findDash = false
        var lastDashIndex = 0
        for (index, n) in email.enumerated() {
            if domain.isEmpty {
                if n == "." {
                    continue
                }
                if n == "-" {
                    findDash = true
                    continue
                }
                if n == "@" {
                    domain.append(n)
                    continue
                }
                if !findDash {
                    login.append(n)
                }
            } else {
                if n == "." {
                    lastDashIndex = domain.count
                }
                domain.append(n)
            }
        }
        domain.removeLast(domain.count - lastDashIndex)
        unique.insert(login + domain)
    }
    
    
    print(unique.count)
}
