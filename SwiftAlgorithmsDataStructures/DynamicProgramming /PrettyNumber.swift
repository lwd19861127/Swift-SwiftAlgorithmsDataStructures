//
//  MakeOne.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-13.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func prettyNumber() {
    let n = Int(readLine()!)!
    var d = [[Int]](repeating: [0], count: n + 1)
    for _ in 1...9 {
        d[1].append(1)
    }
    if n > 1{
        for i in 2...n {
            for j in 0...9 {
                d[i].append(0)
                if (j-1 >= 0) {
                    d[i][j] += d[i-1][j-1]
                }
                if (j+1 <= 9) {
                    d[i][j] += d[i-1][j+1]
                }
            }
        }
    }
    var ans = 0
    for i in 0...9 {
        ans += d[n][i]
    }
    print(ans)
}
