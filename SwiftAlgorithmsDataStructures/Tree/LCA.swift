//
//  BFS.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/24/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

func LCA() {
    // # of vertices
    let n = Int(readLine()!)!
    // # of edges
    let m = n - 1
    var adjList = [[Int]](repeating: [], count: n + 1)
    
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ")
        let u = Int(edge[0])!
        let v = Int(edge[1])!
        adjList[u].append(v)
        adjList[v].append(u) // undirected graph
    }
        
    // BFS - Queue O(V + E)
    var visited = [Bool](repeating: false, count: n + 1)
    
    var depth = [Int](repeating: 0, count: n + 1)
    var parent = [Int](repeating: 0, count: n + 1)
   
    let queue = Queue<Int>()
    queue.enqueue(item: 1) // starting from vertex 1
    visited[1] = true
    depth[1] = 1
    parent[1] = 1
    
    while !queue.isEmpty() {
        let first = queue.dequeue()!
        for v in adjList[first] {
            if !visited[v] {
                queue.enqueue(item: v)
                visited[v] = true
                parent[v] = first
                depth[v] = depth[first] + 1
            }
        }
    }
    
    func theSameParents(_ a: Int, _ b: Int) -> Int {
        if a == b {
            return a
        } else if parent[a] == parent[b] {
            return parent[a]
        } else {
            return theSameParents(parent[a], parent[b])
        }
    }
    
    //The number of pairs to process LCA
    let p = Int(readLine()!)!
    for _ in 0..<p {
        let pair = readLine()!.split(separator: " ")
        var u = Int(pair[0])!
        var v = Int(pair[1])!
        
        if depth[u] == depth[v] {
            print(theSameParents(u, v))
        } else if depth[u] > depth[v] {
            for _ in 1...depth[u] - depth[v] {
                u = parent[u]
            }
            print(theSameParents(u, v))
        } else if depth[u] < depth[v] {
            for _ in 1...depth[v] - depth[u] {
                v = parent[v]
            }
            print(theSameParents(u, v))
        }
    }
}
