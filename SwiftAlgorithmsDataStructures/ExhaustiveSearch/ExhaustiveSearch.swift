//
//  ExhaustiveSearch.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/12/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

/// Print all binary number representation with n digits.
/// - Parameter n: the number of digitss
func printBinaryExhaustive(_ n: Int, _ prefix: String = "", _ indent: String = "") {
    print("\(indent)\(#function)n=\(n), prefix=\(prefix)")
    if n == 0 {
        // we have no more digits left to choose
        print(prefix)
    } else {
        // we have more decisions to make
        // for each available choices (0 or 1)
        for i in 0..<2 {
            // choose one & search more
           printBinaryExhaustive(n - 1, prefix + "\(i)", indent + "    ")
        }
    }
}


func printDecimal(_ n: Int, _ prefix: String = "") {
    // we have no more digits left to choose, stop
    if n == 0 {
        print(prefix)
    } else {
        // we have more decisions to make
        // for each available choices (0 ~ 9)
        for i in 0...9 {
            // choose one & search more
            printDecimal(n - 1, prefix + "\(i)")
        }
    }
}

func permutation(_ word: String, _ soFar: String = "") {
    // we have no more digits left to choose, stop
    if word.count == 0 {
        print(soFar)
    } else {
        // we have more decisions to make
        // for each available choices (chars in word)
        for i in 0..<word.count {
            let ch = word[i]
            permutation(word[0, i] + word[i+1, word.count], soFar + ch)
        }
    }
}

func permutationUnique(_ word: String, _ soFar: String = "", _ set: inout Set<String>) {
    if word.count == 0 {
        set.insert(soFar)
    } else {
        for i in 0..<word.count {
            let ch = word[i]
            permutationUnique(word[0, i] + word[i+1, word.count], soFar + ch, &set)
        }
    }
}
