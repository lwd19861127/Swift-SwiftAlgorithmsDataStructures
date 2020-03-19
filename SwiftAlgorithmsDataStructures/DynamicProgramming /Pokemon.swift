//
//  Pokemon.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-19.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func pokemon(_ n: Int, _ m: Int, _ candies: [[Int]]) -> Int {
    
    struct Edge {
      let from: Int
      let to: Int
      let cost: Int
    }
    
    var edges = [Edge]()
    for i in 0..<n {
        for j in 0..<m {
            let from = i*m + j + 1
            if j+1 < m {
                let to1 = i*m + (j+1) + 1
                edges.append(Edge(from: from, to: to1, cost: candies[i][j]))
            }
            if i+1 < n {
                let to2 = (i+1)*m + j + 1
                edges.append(Edge(from: from, to: to2, cost: candies[i][j]))
            }
        }
    }
    
    var dist = [Int](repeating: 0, count: n*m + 1)
    func bellmanFord(_ edges: [Edge], _ N: Int, _ source: Int) {
      dist[source] = 0
      for _ in 0..<N-1 {
        for edge in edges {
          let from = edge.from
          let to = edge.to
          let cost = edge.cost
          if dist[to] < dist[from] + cost {
            dist[to] = dist[from] + cost
          }
        }
      }
    }
    
    bellmanFord(edges, n*m, 1)
    return dist[n*m] + candies[n-1][m-1]
}


