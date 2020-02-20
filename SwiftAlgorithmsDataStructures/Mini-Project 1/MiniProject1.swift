//
//  MiniProject1.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-15.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation
var mini_project_1_steps = 1
func printAllFilesOrDirectories(path: String) {
    do {
        let fileManager = FileManager.default
        var isDir : ObjCBool = false
        
        print("├─"+path)
        
        let paths = try fileManager.contentsOfDirectory(atPath: path)
        for (index, pa) in paths.enumerated() {
            for _ in (1...mini_project_1_steps) {
                print("│    ", terminator: "")
            }
            if fileManager.fileExists(atPath: pa, isDirectory: &isDir) {
                if isDir.boolValue {
                    // file exists and is a directory
                    mini_project_1_steps += 1
                    printAllFilesOrDirectories(path: pa)
                }
            }
            // when file exists and is not a directory Or file not exists print current path
            if index < paths.count - 1 {
                print("├─ "+pa)
            }else {
                mini_project_1_steps -= 1
                print("└─ "+pa)
            }
        }
    }
    catch {
        print("error")
    }
}

