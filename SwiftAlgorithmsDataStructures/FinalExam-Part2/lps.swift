//
//  lps.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-20.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation
 
func lps(_ s: String) -> String {
    var dp = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count)
    if (s.count == 0) {
        return ""
    }
    if (s.count == 1) {
        return s
    }

    for i in 0..<s.count {
        for j in 0..<s.count {
            if (i >= j) {
                dp[i][j] = true
            } else {
                dp[i][j] = false
            }
        }
    }
    
    var maxLen = 1;
    var rf = 0
    var rt = 0
    for k in 1..<s.count {
        var i = 0
        var j = 0
        while k+i < s.count {
            j = i + k;
            if (s[i] != s[j]) {
                dp[i][j] = false;
            } else {
                dp[i][j] = dp[i + 1][j - 1];
                if (dp[i][j]) {
                    if (k + 1 > maxLen) {
                        maxLen = k + 1;
                        rf = i;
                        rt = j;
                    }
                }
            }
            i += 1
        }
    }
    return s[rf, rt + 1]
}
