//
//  SumofSquareNumbers.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-18.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func judgeSquareSum(_ c: Int) -> Bool {
    var d = [Bool](repeating: false, count: (c+1)*(c+1))
    var i = 0
    var v = 0
    
    while v <= c {
        d[v] = true
        if d[c - v] {
            return true
        }
        i += 1
        v = i * i
    }
    return false
}
