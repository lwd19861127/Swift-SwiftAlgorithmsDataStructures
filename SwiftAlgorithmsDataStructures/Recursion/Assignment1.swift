//
//  Assignment1.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-12.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func evaluate(_ expression: String) -> String {
    if !expression.contains("(") {return expression}
    
    var indexOfLeftBracket = 0
    var indexOfRightBracket = 0
    var indexOfOperat = 0
    for i in 0...expression.count-1 {
        let character = expression[i,i+1]
        if character == "(" {
            indexOfLeftBracket = i
        }
    }
    for j in indexOfLeftBracket...expression.count-1 {
        let character = expression[j, j+1]
        if character == ")" {
            indexOfRightBracket = j
            break
        }
    }
    for m in indexOfLeftBracket...indexOfRightBracket {
        let operat = expression[m, m+1]
        if operat == "+" || operat == "*" {
            indexOfOperat = m
        }
    }
    let first = expression[indexOfLeftBracket+1, indexOfOperat]
    let second = expression[indexOfOperat+1, indexOfRightBracket]
    let operat = expression[indexOfOperat, indexOfOperat+1]
    var result = 0
    
    if operat == "+" {
        result = Int(first)! + Int(second)!
    }
    if operat == "*" {
        result = Int(first)! * Int(second)!
    }
    
    let nextExpression = expression[0, indexOfLeftBracket] + String(result) + expression[indexOfRightBracket+1, expression.count]
    return evaluate(nextExpression)
}
