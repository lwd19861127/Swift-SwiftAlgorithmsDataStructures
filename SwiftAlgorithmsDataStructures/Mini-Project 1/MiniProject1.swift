//
//  MiniProject1.swift
//  SwiftAlgorithmsDataStructures
//
//  Created by WendaLi on 2020-02-15.
//  Copyright © 2020 WendaLi. All rights reserved.
//

import Foundation

func printAllFilesOrDirectories(path: String) {
    let fileManager = FileManager.default
    
    do {
        print("├─ " + path)
        var isDir : ObjCBool = false
        let paths = try fileManager.contentsOfDirectory(atPath: path)
        for (index, pa) in paths.enumerated() {
            if fileManager.fileExists(atPath: pa, isDirectory: &isDir) {
                if isDir.boolValue {
                    // file exists and is a directory
                    printAllFilesOrDirectories(path: pa)
                } else {
                    // file exists and is not a directory
                    print("├─ " + pa)
                }
                
            }
            if index != paths.count - 1 {
                print("│    ├─ "+pa)
            }else {
                print("│    └─ "+pa)
            }
            
        }
    }
    catch {
        print("error")
    }
}

