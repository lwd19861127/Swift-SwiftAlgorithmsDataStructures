//
//  LongestIncreasingSubsequence.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-18.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
    let x = nums.count
    if x == 0 {
        return 0
    }
    var d = [Int](repeating: 1, count: x)
    for i in 1..<x {
        for j in 0..<i {
            if nums[i] > nums[j] {
                d[i] = d[i] > d[j] + 1 ? d[i] : d[j] + 1
            }
        }
    }
    var max = 0
    for i in 0..<d.count {
        max = max > d[i] ? max : d[i]
    }
    return max
}
