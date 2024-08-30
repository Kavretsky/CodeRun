//
//  10.SquareGame.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 30.08.2024.
//

import Foundation

//10. Крош, Ежик и квадратичная игра

func squareGame() {
    let gameCount = Int(readLine()!)!
    var games = [Int]()
    for _ in 1...gameCount {
        let game = Int(readLine()!)!
        games.append(game)
    }
    let max = games.max()!
    var dp = Array(repeating: 0, count: max + 1)
    
    for i in 1...max {
        var j = 1
        while j * j <= i {
            if dp[i - j * j] == 0 {
                dp[i] = 1
                break
            }
            j += 1
        }
    }
    
    for game in games {
        print(dp[game])
    }
}


