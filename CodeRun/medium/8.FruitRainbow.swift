//
//  File.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 30.08.2024.
//

import Foundation

// 8. Фруктовая радуга

var n = 0
var matrix = [[Int]]()

func fruitRainbow() {
    let input = Int(readLine()!)!
    n = input
    for _ in 0..<n {
        let row = readLine()!.split(separator: " ").map { Int(String($0))! }
        matrix.append(row)
    }
    var result: (pathLength: Int, count: Int) = (0, 0)
    
    for i in 0..<n {
        for j in 0..<n {
            let (length, count) = dfs(i, j, [])
            if result.pathLength < length {
                result.pathLength = length
                result.count = count
            } else if result.pathLength == length {
                result.count += count
            }
        }
    }
    
    print("\(result.pathLength) \(result.count)")
}

let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]

func dfs(_ x: Int, _ y: Int, _ visited: Set<Int>) -> (Int, Int) {
    guard x >= 0,
          x < n,
          y >= 0,
          y < n
    else {
        return (0, 0)
    }
    var visited = visited
    visited.insert(x * 10 + y)
    if visited.count == n * n {
        if x == 0 || x == n  - 1 || y == 0 || y == n - 1 {
            return (1, 1)
        } else {
            return (0, 0)
        }
    }
    var result: (pathLength: Int, count: Int) = (0, 0)
    for direction in directions {
        let newX = x + direction.0
        let newY = y + direction.1
        guard newX >= 0,
              newX < n,
              newY >= 0,
              newY < n
        else { continue }
        if matrix[newX][newY] > matrix[x][y] && !visited.contains(newX * 10 + newY) {
            let (length, count) = dfs(newX, newY, visited)
            guard length > 0, count > 0 else { continue}
            if result.pathLength < length {
                result.pathLength = length
                result.count = count
            } else if result.pathLength == length {
                result.count += count
            }
        }
    }
    
    if result == (0, 0) && !(x == 0 || x == n  - 1 || y == 0 || y == n - 1)   {
        return (0,0)
    }
    return (result.pathLength + 1, max(1, result.count))
    
}
