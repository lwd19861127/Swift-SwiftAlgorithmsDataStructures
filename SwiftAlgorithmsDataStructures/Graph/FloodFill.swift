//
//  FloodFill.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-27.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func FloodFill(_ M: [[Int]]) {
    
    var uf = UF(M.count*M.count)
    
    func isAboveOne(_ i: Int, _ j: Int) -> Bool{
        guard i - 1 > 0 else {return false}
        if M[i-1][j] == 1 {
            return true
        } else {
            return false
        }
    }
    func isBlowOne(_ i: Int, _ j: Int) -> Bool{
        guard i + 1 < M.count else {return false}
        if M[i+1][j] == 1 {
            return true
        } else {
            return false
        }
    }
    func isRightOne(_ i: Int, _ j: Int) -> Bool{
        guard j + 1 < M.count else {return false}
        if M[i][j+1] == 1 {
            return true
        } else {
            return false
        }
    }
    func isLeftOne(_ i: Int, _ j: Int) -> Bool{
        guard j - 1 > 0 else {return false}
        if M[i][j-1] == 1 {
            return true
        } else {
            return false
        }
    }
    
    for i in 0..<M.count {
        for j in 0..<M.count{
            if M[i][j] == 1 {
                if isAboveOne(i, j) {
                    uf.union(i*M.count+j, (i-1)*M.count+j)
                }
                if isBlowOne(i, j) {
                    uf.union(i*M.count+j, (i+1)*M.count+j)
                }
                if isRightOne(i, j) {
                    uf.union(i*M.count+j, (i)*M.count+j+1)
                }
                if isLeftOne(i, j) {
                    uf.union(i*M.count+j, (i)*M.count+j-1)
                }
                print(uf)
            }
        }
    }
    
    let size = uf.getSize()
    for i in 0..<size.count {
        if size[i] != 1 {
            print(size[i])
        }
    }
}


