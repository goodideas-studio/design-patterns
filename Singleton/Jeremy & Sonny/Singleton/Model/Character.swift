//
//  Character.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation

class Character {
    static let shared = Character()
    let name = "Hero"
    
    var hp = 100
    var mp = 100
    
    var atk = 100
    var def = 50
    
    var dollars = 0
    var itemArray = [String]()
    
    private init() {
        
    }
}


