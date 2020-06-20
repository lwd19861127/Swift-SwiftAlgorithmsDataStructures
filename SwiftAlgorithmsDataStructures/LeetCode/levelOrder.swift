//
//  levelOrder.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-06-20.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation
 
class levelOrder {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var res = [[Int]]()
        checkValuesOnLevel(&res, root, 0)
        return res
    }
    
    func checkValuesOnLevel(_ res: inout [[Int]], _ node: TreeNode?, _ level: Int) {
        guard let node = node else { return }
        if res.count - 1 < level {
            res.append([Int]())
        }
        res[level].append(node.val)
        
        checkValuesOnLevel(&res, node.left, level + 1)
        checkValuesOnLevel(&res, node.right, level + 1)
    }

}
