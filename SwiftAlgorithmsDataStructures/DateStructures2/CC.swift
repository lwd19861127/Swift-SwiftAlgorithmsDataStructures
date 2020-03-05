//
//  CC.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/25/19.
//  Copyright © 2020 Derrick Park. All rights reserved.
//
import Foundation

/// The `CC` struct represents a data type for determining the connected components
/// in an undirected graph. The `id` operation determines in which connected component
/// a given vertex lies; the `connected` operation determines whether two vertices are
/// in the same connected component; the `count` operation determines the number of connected
/// components; and the `size` operation determines the number of vertices in the connected
/// component containing a given vertex.
/// - The `id` of a connected component is one of the vertices in the connected component:
/// two vertices have the same component identifier iff they are in the same connected component.
/// - This implementation uses depth-first-search.
/// - The initializer takes **Θ(V + E)** time, where **V** is the number of vertices and **E**
/// is the number of edges.
/// - Each instance method takes **Θ(1)** time.
/// - It uses **Θ(V)** extra space (not including the graph).
public struct CC {
    /// marked[v] = has vertex v been marked(visited)?
    private var marked: [Bool]
    /// id[v] = id of connected component containing v
    private var id: [Int]
    /// size[id] = number of vertices in given component
    private var size: [Int]
    /// number of connected components
    private(set) var count: Int = 0
    
    /// Computes the connected components of the undirected graph `G`
    /// - Parameter G: the undirected graph
    public init(G: Graph) {
        marked = [Bool](repeating: false, count: G.V)
        id = [Int](repeating: 0, count: G.V)
        size = [Int](repeating: 0, count: G.V)
        for v in 0..<G.V {
            if !marked[v] {
                dfs(G, v)
                count += 1
            }
        }
    }
    
    /// iterative dfs
    private mutating func dfs(_ G: Graph, _ v: Int) {
        marked[v] = true
        id[v] = count
        size[count] += 1
        for u in G.adj(to: v) {
            if !marked[u] {
                dfs(G, u)
            }
        }
    }
    
    /// Returns the number of vertices in the connected component containing vertex `v`
    /// - Parameter v: the vertex
    /// - Returns: the number of vertices in the connected component containing vertex `v`
    public func size(of v: Int) -> Int {
        return size[id[v]]
    }
    
    /// Returns `true` if vertices `v` and `w` are in the same connected component.
    /// - Parameters:
    ///   - u: one vertex
    ///   - v: the other vertex
    /// - Returns:`true` if vertices `v` and `w` are in the same connected component; `false` otherwise
    public func connected(_ u: Int, _ v: Int) -> Bool {
        return id[u] == id[v]
    }
}
