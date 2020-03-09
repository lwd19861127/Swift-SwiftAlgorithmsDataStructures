//
//  CourseScheduleIII.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-08.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func scheduleCourse(_ courses: [[Int]]) -> Int {
    var coursesCopy = courses
    coursesCopy.sort { (a, b) -> Bool in
        if a[1] - b[1] <= 0 {
            return true
        }else {return false}
    }
    
    var queue = Heap<Int>(elements: []) { (a, b) -> Bool in
        if b - a <= 0 {
            return true
        }else {return false}
    }
    var time = 0;
    for c in coursesCopy {
        if (time + c[0] <= c[1]) {
            queue.enqueue(c[0])
            time += c[0]
        } else if (!queue.isEmpty && queue.peek()! > c[0]) {
            time += c[0] - queue.dequeue()!
            queue.enqueue(c[0])
        }
    }
    return queue.count;
}
