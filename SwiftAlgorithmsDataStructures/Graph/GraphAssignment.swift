//
//  CyclicPermutation.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-27.
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

func repeatingSequence() {
    let firstLine = readLine()!.split(separator: " ")
    // # of vertices
    let a = Int(firstLine[0])!
    // # of edges
    let p = Int(firstLine[1])!
    
    var results = [Int](repeating: 0, count: 1000)
    results.append(a)
    
    var singleResult = canculate(a, p)
    var breakNumber = 0
    while true {
        if !results.contains(singleResult) {
            results.append(singleResult)
            singleResult = canculate(singleResult, p)
        } else {
            breakNumber = singleResult
            break
        }
    }
    
    var num = 0
    for i in results {
        if i != 0 && i != breakNumber {
            num += 1
        } else if i == breakNumber {
            break
        }
    }
    
    print(num)
    
}
func canculate(_ a: Int, _ p: Int) -> Int {
    let m = a / 10
    let n = a % 10
    if m == 0 {
        return Int(pow(Double(n),Double(p)))
    }
    return Int(pow(Double(n),Double(p))) + canculate(m, p)
}

