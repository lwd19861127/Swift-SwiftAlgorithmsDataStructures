//
//  NetworkDelayTime.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-03-13.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

//public int networkDelayTime(int[][] times, int N, int K) {
//
//    /* we will ignore 0th index and index will be assigned on basis of vertex no */
//    List<List<int[]>> graph = new ArrayList<>(N + 1);
//
//    int maxDist = N*100 +1;
//    int [] calculatedDistance = new int[N+1];
//    /* since 0 <= w <= 100 so at worst graph will be a skewed tree */
//    Arrays.fill(calculatedDistance,maxDist);
//    for(int i =0; i <= N; i++){
//        graph.add(new ArrayList<>());
//
//    }
//    for(int[] time : times) /* index 1 in array is vertex index 2 is weight */
//        graph.get(time[0]).add(new int[]{time[1], time[2]});
//
//    PriorityQueue<int[]> pq = new PriorityQueue<>((int [] a, int [] b)->(a[1] - b[1]));
//
//    pq.offer(new int[]{K, 0});
//    Set<Integer> visited = new HashSet<>();
//    int dist = 0;
//    while(!pq.isEmpty()) {
//        int[] curr = pq.poll();
//        /* if that vertex is visited continue no need to update distance because once   visited that vertex has already the shortest distance required to reach it */
//        if(!visited.add(curr[0])) continue;
//
//        dist = curr[1];
//        for(int[] neighbor : graph.get(curr[0])) {
//        /* exploring all the neighbours and adding only those whose distance after relaxation is less than there present distance to be reached and are not visited */
//            if(!visited.contains(neighbor[0]) && (dist +  neighbor[1] < calculatedDistance[neighbor[0]]) )
//                pq.offer(new int[]{neighbor[0], neighbor[1] + curr[1]});
//        }
//    }
//    return visited.size() == N ? dist : -1;
//}

func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
    
    struct Edge {
        let from: Int
        let to: Int
        let cost: Int
    }
    
    var calculatedDistance = [Int](repeating: Int.max, count: N+1)
    var adj = [[Edge]](repeating: [], count: N + 1)
    
    for time in times {
        let edge = Edge(from: time[0], to: time[1], cost: time[2])
        adj[edge.from].append(edge)
    }
    
    let pq = PriorityQueue<[Int]>(priorityFunction: {(a: [Int], b:[Int]) -> Bool in
        return a[1]-b[1]>0
    })
    pq.enqueue([K, 0])
    var visited = Set<Int>()
    var dist = 0
    while !pq.isEmpty {
        let curr = pq.dequeue()
        if visited.contains(curr![0]) {
            continue
        }else {
            visited.insert(curr![0])
        }
        
        dist = curr![1]
        for neighbor in adj[curr![0]] {
            if !visited.contains(neighbor.to) && (dist + neighbor.cost < calculatedDistance[neighbor.to]) {
                pq.enqueue([neighbor.to, neighbor.cost+curr![1]])
                calculatedDistance[neighbor.to] = dist + neighbor.cost
            }
        }
    }
    return visited.count == N ? dist : -1
}
