//
//  repeatingSequence.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-05.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

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
