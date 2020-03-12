//
//  Minimum Cost Flow.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-11.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func minimumCostFlow() {
    struct Edge {
        let from: Int
        let to: Int
        let cost: Int
        
        func equel (_ e: Edge) -> Bool {
            if e.from == self.from && e.to == self.to && e.cost == self.cost  {
                return true
            }else {
                return false
            }
        }
        
        func same (_ e: Edge) -> Bool {
            if (e.from == self.from && e.to == self.to && e.cost == self.cost) || (e.from == self.to && e.to == self.from && e.cost == self.cost)  {
                return true
            }else {
                return false
            }
        }
    }
    
    let firstLine = readLine()!.split(separator: " ")
    // # of cities
    let N = Int(firstLine[0])!
    // # of pipes
    let M = Int(firstLine[1])!
    // Enhancer’s strength
    let D = Int(firstLine[2])!
    
    var adj = [[Edge]](repeating: [], count: N + 1)
    var dist = [Int](repeating: Int.max, count: N + 1)
    var check = [Bool](repeating: false, count: N + 1)
    var distPath = [[Edge]](repeating: [], count: N + 1)
    
    var currentPipes = [Edge]()
    var newPipes = [Edge]()
    
    for i in 1...M {
        // 1 2 3 (from to cost)
        let edgeInput = readLine()!.split(separator: " ").compactMap { Int($0) }
        let from = edgeInput[0]
        let to = edgeInput[1]
        let cost = edgeInput[2]
        adj[from].append(Edge(from: from, to: to, cost: cost))
        adj[to].append(Edge(from: to, to: from, cost: cost))
        
        if i <= N-1 {
            let edge = Edge(from: from, to: to, cost: cost)
            currentPipes.append(edge)
        }
    }
    
    //from city 1
    dist[1] = 0
    
    for _ in 1...N-1 {
      // the vertex of min value in dist
      var min = Int.max
      var u = 1
      for i in 1...N {
        if !check[i] && dist[i] < min {
          min = dist[i]
          u = i
        }
      }
      
      check[u] = true
      for edge in adj[u] {
        // relax edges
        let v = edge.to
        if dist[v] > dist[u] + edge.cost {
            dist[v] = dist[u] + edge.cost
            if distPath[v].count == 0 {
                distPath[v].append(edge)
            }else {
                distPath[v][0] = edge
            }
        }
      }
    }
    
    
    //find the path of newPipes
    var count = 0
    func findPath(_ edge: Edge) {
        if !newPipes.contains(where: { (e) -> Bool in
            if e.equel(edge) {return true}else{return false}
        }) {
            newPipes.append(edge)
            if !currentPipes.contains(where: { (e) -> Bool in
                if e.equel(edge) || e.same(edge) {return true}else{return false}
            }){
                count += 1
            }
        }
        if edge.from != 1 {
            let from = edge.from
            let newEdge = distPath[from][0]
            findPath(newEdge)
        }
    }
    
    for i in 2...N {
        findPath(distPath[i][0])
    }
    
    print(count)
}
