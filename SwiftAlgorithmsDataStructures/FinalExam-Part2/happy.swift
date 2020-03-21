//
//  Happy.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-20.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func happy(_ s: String){
    var happy = 0
    var sad = 0
    for i in 0..<s.count {
        if s[i] == ":" && s[i+1] == "-" && s[i+2] == ")" {
            happy += 1
        }
        if s[i] == ":" && s[i+1] == "-" && s[i+2] == "("  {
            sad += 1
        }
    }
    if happy == 0 && sad == 0 {
        print("none")
    } else if happy == sad {
        print("unsure")
    }
    if happy > sad {
        print("happy")
    }
    if happy < sad {
        print("sad")
    }
}


