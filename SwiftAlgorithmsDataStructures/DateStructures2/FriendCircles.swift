//
//  FriendCircles.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-26.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func findCircleNum(_ M: [[Int]]) -> Int {
    
    //矩阵是对称的 矩阵斜线上方三角形的边长
    let n = M.count
    if n == 1 {return 1}
    
    let studentsNum = n
    var students = UF(studentsNum)
    
    for i in 0..<n-1 {
        for j in i+1...n-1 {
            if M[i][j] == 1 {
                students.union(i, j)
            }
        }
    }
    return students.count
}
