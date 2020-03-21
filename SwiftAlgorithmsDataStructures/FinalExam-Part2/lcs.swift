//
//  lcs.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-20.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func findLCSDPBottomUp(_ s1: String, _ s2: String) -> Int{
    var dp = [[Int]](repeating: [Int](repeating: 0, count: s2.count+1), count: s1.count+1)
    for i in 0...s1.count {
        for j in 0...s2.count {
            if (i == 0 || j == 0) {
              dp[i][j] = 0
            } else if (s1[i-1] == s2[j-1]) {
              dp[i][j] = dp[i-1][j-1] + 1
            } else {
              dp[i][j] = max(dp[i-1][j], dp[i][j-1])
            }
        }
      }
    return dp[s1.count][s2.count]
}
