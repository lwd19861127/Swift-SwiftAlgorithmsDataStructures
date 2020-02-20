//
//  QueensSolver.swift
//  SwiftAGDS
//
//  Created by Derrick Park on 2019-03-13.
//  Copyright © 2019 Derrick Park. All rights reserved.
//

import Foundation

/// Write a function solveQueens that accepts a Board as a parameter
/// and tries to place 8 queens on it safely.
///
/// - Your method should stop exploring if it finds a solution
/// - You are allowed to change the function header (args or return type)
/// - Your total recursive calls should not exceed 120 times.

var mini_project_2_steps = 0
var mini_project_2_sol = 0
var mini_project_2_first = false
var mini_project_2_firstSteps = 0
func solveQueens(board: inout Board, col: Int) {
	mini_project_2_steps += 1
    
    if mini_project_2_first != true {
        mini_project_2_firstSteps += 1
    }
    
    if col == 8 {
        mini_project_2_first = true
        mini_project_2_sol += 1
        print(board.description)
        return
    }
    
    for i in 0...7 {
        if board.isSafe(row: i, col: col) {
            board.place(row: i, col: col)
            solveQueens(board: &board, col: col + 1)
            board.remove(row: i, col: col)
        }
    }
    
}

