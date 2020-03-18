//
//  OneTwoThree.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-17.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func oneTwoThree() {
    let t = Int(readLine()!)
    for _ in 1...t! {
        let x = Int(readLine()!)
        var d = [Int](repeating: 0, count: x! + 1)
        d[1] = 1
        d[2] = 2
        d[3] = 4
        
        for i in 4...x! {
            d[i] = d[i-1] + d[i-2] + d[i-3]
        }
        print(d[x!])
    }
}
