//
//  CourseScheduleII.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-05.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func CourseScheduleII(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    
   var course = [[Int]](repeating: [Int](), count: numCourses)
   var indegree = [Int](repeating: 0, count: numCourses)
   
    for c in prerequisites { // M edges
       let v = c[0]
       let u = c[1]
       course[u].append(v)
       indegree[v] += 1
   }
    
    
    let q = Queue<Int>()
    // initial state
    for v in 0...numCourses-1 {
        if indegree[v] == 0 {
            q.enqueue(item: v)
        }
    }
    
    if q.count == 0 {
        return []
    }
    
    var finishedCourse = [Int]()
    while !q.isEmpty() {
        let x = q.dequeue()!
        finishedCourse.append(x)// process
        for v in course[x] {
            indegree[v] -= 1 // decrement indegree
            if indegree[v] == 0 {
                q.enqueue(item: v)
            }
        }
    }
    if finishedCourse.count != numCourses {
        return []
    }
    return finishedCourse
}
