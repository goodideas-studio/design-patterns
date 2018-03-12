//
//  main.swift
//  SoJ-2
//
//  Created by 高菘駿 on 2018/3/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

struct StringIterator: IteratorProtocol {
    let strings: [String]
    var index: Int
    
    init (strings: [String]) {
        self.strings = strings
        index = 0
    }
    
    mutating func next() -> String? {
        guard index < strings.count else { return nil}
        let string = strings[index]
        index += 1
        return string
    }
}

struct StringSequence: Sequence {
    let strings: [String]
    func makeIterator() -> StringIterator {
        return StringIterator(strings: strings)
    }
}


for string in StringSequence(strings: ["apple", "banana", "orange"]) {
    print(string)
}
