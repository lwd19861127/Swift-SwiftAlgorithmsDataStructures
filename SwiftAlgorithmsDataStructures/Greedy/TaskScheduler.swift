//
//  TaskScheduler.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-06.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

var taskQueue = Array<Character>()

func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
    var tasksCopy = tasks
    return leastIntervalInout(&tasksCopy, n)
}

func leastIntervalInout (_ tasks: inout [Character], _ n: Int) -> Int {
    if tasks.count == 0 {
        return taskQueue.count
    }
    for i in 0...tasks.count-1 {
        if taskQueue.count == 0 {
            taskQueue.append(tasks[0])
            tasks.remove(at: 0)
            if tasks.count != 0 {
                return leastIntervalInout(&tasks, n)
            }
        } else {
            let num = taskQueue.count >= n ? n : taskQueue.count
            var flag = false
            for j in 0..<num {
                if tasks[i] == taskQueue[taskQueue.count-1-j] {
                    flag = true
                }
            }
            if !flag {
                taskQueue.append(tasks[i])
                tasks.remove(at: i)
                if tasks.count != 0 {
                    return leastIntervalInout(&tasks, n)
                }
            }
        }
    }
    if tasks.count != 0 {
        taskQueue.append("i")
        return leastIntervalInout(&tasks, n)
    }
    return taskQueue.count
}



