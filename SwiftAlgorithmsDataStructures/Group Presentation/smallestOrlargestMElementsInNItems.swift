//
//  smallestOrlargestMElementsInNItems.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-23.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func smallestOrlargestMElementsInNItems() {
    var nItemsArrayInt: [Int] = []
    var m = 0

    print("Please Enter N elements.Please separate by commas")
    let nItems = readLine()
    guard let nItemsArrayString = nItems?.split(separator: ",") else { return }
    for i in nItemsArrayString {
        nItemsArrayInt.append(Int(i)!)
    }
    
    print("Please Enter number of M")
    let mString = readLine()
    m = Int(mString!)!
    
    print("Please Enter smallest or largest, s or l")
    let priorityFunction = readLine()
    if priorityFunction == "s" {
        var heap = Heap(elements: [nItemsArrayInt[0]], priorityFunction: >)
        for i in 1...nItemsArrayInt.count - 1{
            if heap.count < m {
                heap.enqueue(nItemsArrayInt[i])
                continue
            }
            if heap.count == m {
                if nItemsArrayInt[i] < heap.peek()! {
                    heap.dequeue()
                    heap.enqueue(nItemsArrayInt[i])
                }
            }
        }
        print(heap.elements)
    }else if priorityFunction == "l" {
        var heap = Heap(elements: [nItemsArrayInt[0]], priorityFunction: <)
        for i in 1...nItemsArrayInt.count - 1{
            if heap.count < m {
                heap.enqueue(nItemsArrayInt[i])
                continue
            }
            if heap.count == m {
                if nItemsArrayInt[i] > heap.peek()! {
                    heap.dequeue()
                    heap.enqueue(nItemsArrayInt[i])
                }
            }
        }
        print(heap.elements)
    }
}
