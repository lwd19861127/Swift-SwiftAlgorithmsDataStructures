//
//  SumofSquareNumbers-2 .swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-19.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func judgeSquareSum2(_ x: Int) -> Int {
    var d = [Int](repeating: 0, count: x + 1)
    for i in 0...x {
        d[i] = i
        let n = Int(sqrt(Double(i)))
        for j in 0...n {
            d[i] = d[i] < d[i-j*j] + 1 ? d[i] : d[i-j*j] + 1
        }
    }
    return d[x]
}
