//
//  Tomato Farm.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-03.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func TomatoFarm() {
    
    let firstLine = readLine()!.split(separator: " ")
    // # of width
    let m = Int(firstLine[0])!
    // # of high
    let n = Int(firstLine[1])!
    
    var M = [[Int]]()
    for _ in 1...n {
        var L = readLine()!.split(separator: " ")
        var N = [Int]()
        for i in L {
            N.append(Int(i)!)
        }
        M.append(N)
    }
    
    
    var ripe = Queue<(Int, Int)>()
    var wait = Queue<(Int, Int)>()
    var days = 0
    
    func whatIsAbove(_ i: Int, _ j: Int) -> Int{
        guard i - 1 >= 0 else {return -2}
        return M[i-1][j]
    }
    func whatIsBlow(_ i: Int, _ j: Int) -> Int{
        guard i + 1 < n else {return -2}
        return M[i+1][j]
    }
    func whatIsRight(_ i: Int, _ j: Int) -> Int{
        guard j + 1 < n else {return -2}
        return M[i][j+1]
    }
    func whatIsLeft(_ i: Int, _ j: Int) -> Int{
        guard j - 1 >= 0 else {return -2}
        return M[i][j-1]
    }

    func canGetRipe(_ i: Int, _ j: Int) -> Bool{
        if M[i][j] == -1 || M[i][j] == 1 {
            return true
        }
        if (whatIsAbove(i, j) == -1 || whatIsAbove(i, j) == -2) && (whatIsBlow(i, j) == -1 || whatIsBlow(i, j) == -2) && (whatIsRight(i, j) == -1 || whatIsRight(i, j) == -2) && (whatIsLeft(i, j) == -1 || whatIsLeft(i, j) == -2) {
            return false
        }
        return true
    }
    
    func getRipe(_ i: Int, _ j: Int) -> Int{
        var num = 0
        if whatIsAbove(i, j) == 0 {
            M[i-1][j] = 1
            ripe.enqueue(item: (i-1, j))
            num += 1
        }
        if whatIsBlow(i, j) == 0 {
            M[i+1][j] = 1
            ripe.enqueue(item: (i+1, j))
            num += 1
        }
        if whatIsRight(i, j) == 0 {
            M[i][j+1] = 1
            ripe.enqueue(item: (i, j+1))
            num += 1
        }
        if whatIsLeft(i, j) == 0 {
            M[i][j-1] = 1
            ripe.enqueue(item: (i, j-1))
            num += 1
        }
        return num
    }
    
    for i in 0..<n {
        for j in 0..<m{
            if canGetRipe(i, j) == false {
                days = -1
            }
            if M[i][j] == 1 {
                ripe.enqueue(item: (i, j))
            }
        }
    }
    var initNum = ripe.count
    
    while days != -1 && ripe.count != 0 {
        var add = 0
        while initNum != 0 {
            let (i,j) = ripe.dequeue()!
            add += getRipe(i, j)
            initNum -= 1
        }
        if add != 0 {days += 1}
        initNum += add
    }
        
    print(days)
}

