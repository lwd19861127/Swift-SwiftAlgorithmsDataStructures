//
//  PartitionLabels.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-09.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func partitionLabels(_ S: String) -> [Int] {
    var result = [Int]()
    cut(S, &result)
    return result
}

func cut(_ S: String, _ r: inout [Int]) {
    var lastIndex = S.lastIndex(of: S.first!)?.utf16Offset(in: S)
    func reLoop(_ index: Int) -> Int {
        var lastIndex = index
        for i in 0...index {
            let watchingIndex = S.lastIndex(of: Character(S[i,i+1]))?.utf16Offset(in: S)
            if watchingIndex! > lastIndex {
                lastIndex = watchingIndex!
                return reLoop(lastIndex)
            }
        }
        return lastIndex
    }
    lastIndex = reLoop(lastIndex!)
    r.append(lastIndex!+1)
    if lastIndex != S.count-1 {
        let newS = S[lastIndex!+1, S.count]
        cut(newS, &r)
    }
}
