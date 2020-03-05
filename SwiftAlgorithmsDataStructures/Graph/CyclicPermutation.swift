//
//  CyclicPermutation.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-05.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func CyclicPermutation() {
    let T = Int(readLine()!)
    for _ in 1...T! {
        let sizeN = Int(readLine()!)
        var permutationOfN = readLine()!.split(separator: " ").map {Int($0)!}
        
        var visited = [Bool](repeating: false, count: sizeN! + 1)

        var numberOfCycle = 0
        for i in 0..<permutationOfN.count {
            if !visited[i+1] {
                dfsearch(start: i+1, visited: &visited, adjList: &permutationOfN)
                numberOfCycle += 1
            }
        }
        print(numberOfCycle)
    }
}
func dfsearch(start: Int, visited: inout [Bool], adjList: inout [Int]) {
    guard start-1 >= 0 else {return}
    visited[start] = true
    if !visited[adjList[start-1]] {
        dfsearch(start: adjList[start-1], visited: &visited, adjList: &adjList)
    }
}
