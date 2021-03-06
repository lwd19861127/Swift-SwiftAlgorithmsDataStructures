//
//  2xNtiles-2 .swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-17.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func twoxNtiles_2(_ x: Int) -> Int {
    var d = [Int](repeating: 0, count: x + 1)
    if x == 1 {
        return 1
    }
    if x == 2 {
        return 2
    }
    d[1] = 1
    d[2] = 3
    
    for i in 3...x {
        d[i] = d[i-1] + 2*d[i-2]
    }
    return d[x]
}
