//
//  Non-decreasingDigits.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-18.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

//https://www.geeksforgeeks.org/total-number-of-non-decreasing-numbers-with-n-digits/
//Count of non-decreasing numbers with n digits = N*(N+1)/2*(N+2)/3* ....*(N+n-1)/n
//Where N = 10

func nonDecreasingDigits(_ x: Int) -> Int {
    let N = 10;
    // Compute value of N * (N+1)/2 *
    // (N+2)/3 * ....* (N+n-1)/n
    var count = 1;
    for i in 1...x {
        count *= (N + i - 1);
        count /= i;
    }
    return count;
}



