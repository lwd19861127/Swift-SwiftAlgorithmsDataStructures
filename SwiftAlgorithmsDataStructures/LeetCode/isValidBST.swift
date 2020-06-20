//
//  File.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-06-20.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation
 
class isValidBST {
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTRecursive(root, Int.min, Int.max)
    }
    
    func isValidBSTRecursive(_ node: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        if let currentNode = node {
            if currentNode.val < max && currentNode.val > min &&
                isValidBSTRecursive(currentNode.left, min, currentNode.val) &&
                isValidBSTRecursive(currentNode.right, currentNode.val, max) {
                    return true
            }
        } else {
            return true
        }
        return false
    }
}
