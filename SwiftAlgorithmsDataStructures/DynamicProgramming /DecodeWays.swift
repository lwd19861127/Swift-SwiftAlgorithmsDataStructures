//
//  DecodeWays.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-19.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func numDecodings(_ s: String) -> Int {
    if(s.first == "0") {
        return 0
    }
    if (s.count == 1) {
        return 1
    }
    var secondLast = 1 //string with 0 length
    var last = 1 //string with 1 length
    var tmp = 0
    //iterate for the 2->length
    for i in 2...s.count {
        if(s[i-1] != "0") {
            tmp = last
        }
        if (s[i-2] == "1" || s[i-2] == "2" && s[i-1] <= "6") {
            tmp += secondLast
        }
        secondLast = last
        last = tmp
        tmp = 0
    }
    return last
}
