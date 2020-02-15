//
//  Searching.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by Derrick Park on 2/10/20.
//  Copyright © 2020 Derrick Park. All rights reserved.
//

import Foundation

// DocString: option + command + /

/// Linear Search Algorithm
/// Returns the index of the given target value from the collection.
/// otherwise, nil
/// O(N)
/// - Parameters:
///   - collection: an array of integers
///   - target: search target
func linearSearch<T: Equatable>(_ collection: [T], _ target: T) -> Int? {
    for (index, element) in collection.enumerated() where element == target {
        return index
    }
    return nil
}

/// O(lg N)
func binarySearch<T: Comparable>(_ collection: [T], _ target: T) -> Int? {
    var lower = 0
    var upper = collection.count - 1
    
    while lower <= upper {
        let mid = (lower + upper) / 2
        if collection[mid] == target {
            return mid
        } else if collection[mid] < target {
            lower = mid + 1
        } else {
            upper = mid - 1
        }
    }
    return nil
}
