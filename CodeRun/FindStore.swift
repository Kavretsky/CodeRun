//
//  FindStore.swift
//  CodeRun
//
//  Created by Nikolay Kavretsky on 24.08.2024.
//

import Foundation

// Найти склад
func findStore() {
    struct Order {
        let deliverTo: Int
        let availableStores: [Int]
    }
    let connectionNum = readLine()!.split(separator: " ").compactMap { Int(String($0))! }.first!
    var clusters = [Set<Int>]()
    for _ in 1...connectionNum {
        let connection = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
        var isClusterFound = false
        for (index, cluster) in clusters.enumerated() {
            if cluster.contains(connection[0]) || cluster.contains(connection[1]) {
                clusters[index].insert(connection[0])
                clusters[index].insert(connection[1])
                isClusterFound = true
            }
        }
        if !isClusterFound {
            let newCluster: Set<Int> = [connection[0], connection[1]]
            clusters.append(newCluster)
        }
    }
    
    let orderNum = readLine()!.split(separator: " ").compactMap { Int(String($0))! }.first!
    var orders: [Order] = []
    for _ in 1...orderNum {
        let storeAndNumStoresWithGoods = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
        let storesWithGoods = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
        let order = Order(deliverTo: storeAndNumStoresWithGoods[0], availableStores: storesWithGoods)
        orders.append(order)
    }
    
    for order in orders {
        if let cluster = clusters.first(where: { $0.contains(order.deliverTo) }) {
            var resultStores = [Int]()
            for availableStore in order.availableStores {
                if cluster.contains(availableStore) {
                    resultStores.append(availableStore)
                }
            }
            var result = ""
            result += "\(resultStores.count) "
            result += resultStores.map { String($0) }.joined(separator: " ")
            print(result)
        } else {
            print(0)
        }
    }
}
