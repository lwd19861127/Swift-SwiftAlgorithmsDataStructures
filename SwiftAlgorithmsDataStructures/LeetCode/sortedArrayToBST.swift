//
//  sortedArrayToBST.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-06-20.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

class sortedArrayToBST {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return makeTree(nums, 0, nums.count - 1)
    }
    
    func makeTree(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard start <= end else { return nil}
        
        let mid = (start + end) / 2
        let node = TreeNode(nums[mid])
        node.left = makeTree(nums, start, mid - 1)
        node.right = makeTree(nums, mid + 1, end)
        return node
    }
}
