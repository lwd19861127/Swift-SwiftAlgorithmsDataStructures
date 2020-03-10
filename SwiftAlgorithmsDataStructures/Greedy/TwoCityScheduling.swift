//
//  TwoCityScheduling.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-10.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var costsCopy = costs
    costsCopy.sort { (a, b) -> Bool in
        if abs(a[0] - a[1]) > abs(b[0] - b[1]){
            return true
        }else {return false}
    }
    var cost = 0
    var city0 = 0
    var city1 = 0
    let maxCity = costsCopy.count / 2
    for cityCosts in costsCopy {
        if cityCosts[0] < cityCosts[1] && city0 < maxCity || city1 == maxCity {
            cost += cityCosts[0]
            city0 += 1
        }else {
            cost += cityCosts[1]
            city1 += 1
        }
    }
    return cost
}
