//
//  ClimbingStairs.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-17.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    var d = [Int](repeating: 0, count: n + 1)
//    if n == 1 {
//        return 1
//    }
//    if n == 2 {
//        return 2
//    }
//    if d[n] > 0 {
//        return d[n]
//    }
//    d[n] = climbStairs(n-1) + climbStairs(n-2)
//    return d[n]
    if n == 1 {
        return 1
    }
    if n == 2 {
        return 2
    }
    d[1] = 1
    d[2] = 2
    for i in 3...n {
        d[i] = d[i-1] + d[i-2]
    }
    return d[n]
}
