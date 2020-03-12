//
//  CheapestFlightsWithinKStops.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-12.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

typealias element = (city: Int, stops: Int, runningCost: Int)

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
    var graph = [Int:[(Int, Int)]]()

    for flight in flights {
        graph[flight[0], default: []].append((flight[1], flight[2]))
    }

    var queue = [element]()
    queue.append((city: src, stops: 0, runningCost: 0))

    var minCost = Int.max

    while !queue.isEmpty {
        let (city, stops, runningCost) = queue.removeFirst()

        if city == dst {
            minCost = min(minCost, runningCost)
            continue
        }

        if stops > K || runningCost > minCost {
            continue
        }

        for (nextCity, flightCost) in graph[city] ?? [] {
            queue.append((nextCity, stops + 1, runningCost + flightCost))
        }
    }

    return minCost != Int.max ? minCost : -1
}

//func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ K: Int) -> Int {
//    struct Edge {
//        let from: Int
//        let to: Int
//        let cost: Int
//
//        func equel (_ e: Edge) -> Bool {
//            if e.from == self.from && e.to == self.to && e.cost == self.cost  {
//                return true
//            }else {
//                return false
//            }
//        }
//    }
//
//    var adj = [[Edge]](repeating: [], count: n + 1)
//    var dist = [Int](repeating: Int.max, count: n + 1)
//    var check = [Bool](repeating: false, count: n + 1)
//    var distPath = [[Edge]](repeating: [], count: n + 1)
//    var newPipes = [Edge]()
//
//    for i in 0..<flights.count {
//        // 1 2 3 (from to cost)
//        let edgeInput = flights[i]
//        let from = edgeInput[0]
//        let to = edgeInput[1]
//        let cost = edgeInput[2]
//        adj[from].append(Edge(from: from, to: to, cost: cost))
//    }
//
//    if K == 0 {
//        if adj[src].count > 0 {
//            for e in adj[src] {
//                if e.to == dst {
//                    return e.cost
//                }
//            }
//        }
//    }
//
//    //from city src
//    dist[src] = 0
//
//    for _ in 1...n-1 {
//      // the vertex of min value in dist
//      var min = Int.max
//      var u = src
//      for i in 1...n {
//        if !check[i] && dist[i] < min {
//          min = dist[i]
//          u = i
//        }
//      }
//
//      check[u] = true
//      for edge in adj[u] {
//        // relax edges
//        let v = edge.to
//        if dist[v] > dist[u] + edge.cost {
//            dist[v] = dist[u] + edge.cost
//            if distPath[v].count == 0 {
//                distPath[v].append(edge)
//            }else {
//                distPath[v][0] = edge
//            }
//        }
//      }
//    }
//
//    //find the path of newPipes
//    var count = 0
//    var cost = 0
//    func findPath(_ edge: Edge) {
//        count += 1
//        cost += edge.cost
//        if edge.from != src {
//            let from = edge.from
//            let newEdge = distPath[from][0]
//            findPath(newEdge)
//        }
//    }
//
//    if distPath[dst].count > 0 {
//         findPath(distPath[dst][0])
//    }else {
//        return -1
//    }
//
//    if count-1 > K {
//        return -1
//    }else {
//
//    }
//    return cost
//}
