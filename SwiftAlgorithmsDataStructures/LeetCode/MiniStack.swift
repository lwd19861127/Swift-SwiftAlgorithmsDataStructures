//
//  MiniStack.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-06-21.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

class MinStack {
    var stack: [Int]
    var minIndex = 0

    /** initialize your data structure here. */
    init() {
        stack = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        let currMin = stack[minIndex]
        if x < currMin {
            minIndex = stack.count - 1
        }
    }
    
    func pop() {
        stack.removeLast()
        if stack.count > 1 {
            var temp = stack[minIndex]
            for i in 1..<stack.count {
                if stack[i] < temp {
                    temp = stack[i]
                    minIndex = i
                }
            }
        } else {
            minIndex = 0
        }
    }
    
    func top() -> Int {
        return stack.last ?? 0
    }
    
    func getMin() -> Int {
        guard stack.count > 0 else {return -1}
        return stack[minIndex]
    }
}
