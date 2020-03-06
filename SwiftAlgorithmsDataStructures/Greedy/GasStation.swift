//
//  GasStation.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-05.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
    
    for i in (0...gas.count-1).reversed() {
        var gasLeft = gas[i]
        var j = i
        for m in 1...gas.count {
            if m != gas.count {
                gasLeft -= cost[j]
                if gasLeft >= 0 {
                    gasLeft += gas[(j+1) % gas.count]
                }else {
                    break
                }
            }else {
                gasLeft -= cost[j]
                if gasLeft <= 0 {
                    break
                }
            }
            j = (j+1) % gas.count
        }
        if gasLeft >= 0 {
            return i
        }
    }
    return -1
}
