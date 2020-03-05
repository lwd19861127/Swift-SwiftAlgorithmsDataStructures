//
//  Bridges.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-04.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func Bridges() {
    let n = Int(readLine()!)!
    
    var M = [[Int]]()
    for _ in 1...n {
        let L = readLine()!.split(separator: " ")
        var N = [Int]()
        for i in L {
            N.append(Int(i)!)
        }
        M.append(N)
    }

    var uf = UF(n*n)
    
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
    
    for i in 0..<n {
        for j in 0..<n{
            if M[i][j] == 1 {
                if isAboveOne(i, j) {
                    uf.union(i*n+j, (i-1)*n+j)
                }
                if isBlowOne(i, j) {
                    uf.union(i*n+j, (i+1)*n+j)
                }
                if isRightOne(i, j) {
                    uf.union(i*n+j, i*n+j+1)
                }
                if isLeftOne(i, j) {
                    uf.union(i*n+j, i*n+j-1)
                }
            }
        }
    }
    
    var island = [Int]()
    
    let group = uf.getParent()
    let size = uf.getSize()
    for i in 0..<size.count {
        if size[i] != 1 {
            island.append(group[i]+2)
            for j in 0..<group.count {
                let x = j / n
                let z = j % n
                if group[j] == group[i] {
                    M[x][z] = group[i]+2
                }
            }
        }
    }
    
    var ripe = Queue<(Int, Int)>()
    var days = 0
    var bridge = 0
    
    func whatIsAbove(_ i: Int, _ j: Int, _ V: inout [[Int]]) -> Int{
        guard i - 1 >= 0 else {return -1}
        return V[i-1][j]
    }
    func whatIsBlow(_ i: Int, _ j: Int, _ V: inout [[Int]]) -> Int{
        guard i + 1 < n else {return -1}
        return V[i+1][j]
    }
    func whatIsRight(_ i: Int, _ j: Int, _ V: inout [[Int]]) -> Int{
        guard j + 1 < n else {return -1}
        return V[i][j+1]
    }
    func whatIsLeft(_ i: Int, _ j: Int, _ V: inout [[Int]]) -> Int{
        guard j - 1 >= 0 else {return -1}
        return V[i][j-1]
    }
    
    func getRipe(_ i: Int, _ j: Int, _ x: Int, _ V: inout [[Int]]) -> (Int,Int){
        var num = 0
        var anotherIsland = 0
        if whatIsAbove(i, j, &V) == 0 {
            V[i-1][j] = x
            ripe.enqueue(item: (i-1, j))
            num += 1
        }else if whatIsAbove(i, j, &V) != -1 && whatIsAbove(i, j, &V) != x {
            num = -1
            anotherIsland = whatIsAbove(i, j, &V)
            return (num, anotherIsland)
        }
        if whatIsBlow(i, j, &V) == 0 {
            V[i+1][j] = x
            ripe.enqueue(item: (i+1, j))
            num += 1
        }else if whatIsBlow(i, j, &V) != -1 && whatIsBlow(i, j, &V) != x {
            num = -1
            anotherIsland =  whatIsBlow(i, j, &V)
            return (num, anotherIsland)
        }
        if whatIsRight(i, j, &V) == 0 {
            V[i][j+1] = x
            ripe.enqueue(item: (i, j+1))
            num += 1
        }else if whatIsRight(i, j, &V) != -1 && whatIsRight(i, j, &V) != x {
            num = -1
            anotherIsland = whatIsRight(i, j, &V)
            return (num, anotherIsland)
        }
        if whatIsLeft(i, j, &V) == 0 {
            V[i][j-1] = x
            ripe.enqueue(item: (i, j-1))
            num += 1
        }else if whatIsLeft(i, j, &V) != -1 && whatIsLeft(i, j, &V) != x{
            num = -1
            anotherIsland = whatIsLeft(i, j, &V)
            return (num, anotherIsland)
        }
        return (num, anotherIsland)
    }
    
    while island.count != 0 {
        while !ripe.isEmpty() {ripe.dequeue()}
        days = 0
        var V = M
        for i in 0..<n {
            for j in 0..<n{
                if V[i][j] == island[0] {
                    ripe.enqueue(item: (i, j))
                }
            }
        }
        var initNum = ripe.count
        while ripe.count != 0 {
            var add = 0
            var flag = false
            while initNum != 0 {
                let (i,j) = ripe.dequeue()!
                let (num, anotherIsland) = getRipe(i, j, island[0], &V)
                if num != -1 {
                    add += num
                }else {
                    island.remove(at: 0)
                    let index = island.firstIndex(of: anotherIsland)
                    if index != nil {
                        island.remove(at: index!)
                    }
                    flag = true
                    break
                }
                initNum -= 1
            }
            if flag {break}
            if add != 0 {days += 1}
            initNum += add
        }
        if bridge == 0 {
            bridge = days
        }else if days < bridge {
            bridge = days
        }
    }
    print(bridge)
}


