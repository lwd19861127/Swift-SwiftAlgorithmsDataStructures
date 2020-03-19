//
//  MaximumSubarray.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-19.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    if (nums.count == 0) {
        return 0
    }
    var d = [Int](repeating: 0, count: nums.count)
    d[0] = nums[0]
    var max = d[0]
    for i in 1..<nums.count {
        if (d[i - 1] > 0) {
            d[i] = d[i - 1] + nums[i]
        } else {
            d[i] = nums[i]
        }
        if max < d[i] {
            max = d[i];
        }
    }
    return max;
}
