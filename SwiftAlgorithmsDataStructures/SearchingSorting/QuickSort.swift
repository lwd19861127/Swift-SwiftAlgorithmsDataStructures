//
//  QuickSort.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-12.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func quickSort<T: Comparable>(_ collection: [T]) -> [T] {
    
    if collection.count <= 1 {return collection}
    
    let last = collection[collection.count-1]
    
    var left: [T] = []
    var right: [T] = []
    
    for i in collection[0...collection.count - 2] {
        if i <= last {
            left.append(i)
        }else {
            right.append(i)
        }
    }
    
    left = quickSort(left)
    right = quickSort(right)
    
    return marge(left, last, right)
}

func marge<T: Comparable>(_ left: [T], _ last: T, _ right: [T]) -> [T] {
    var result: [T] = []
    result.append(contentsOf: left)
    result.append(last)
    result.append(contentsOf: right)
    return result
}
