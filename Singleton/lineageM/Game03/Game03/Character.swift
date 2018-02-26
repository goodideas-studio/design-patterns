//
//  File.swift
//  Game03
//
//  Created by 高菘駿 on 2018/2/26.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

class Character {
    var HP: Int
    var maxHP: Int
    var MP: Int
    var maxMP: Int
    var ATK: Int
    var DEF: Int
    
    init (HP: Int, maxHP: Int, MP: Int, maxMP: Int, ATK: Int, DEF: Int) {
        self.HP = HP
        self.maxHP = maxHP
        self.MP = MP
        self.maxMP = maxMP
        self.ATK = ATK
        self.DEF = DEF
    }
    
}

class Backpack {
    static let current = Backpack()
    var backpackItems = ["red_potion", "orange_potion"]//[String]()
    
    private init() { }
    
    func addItems(itemName: String) {
        backpackItems.append(itemName)
    }
    
    func useItems(itemLocation: Int) {
        backpackItems.remove(at: itemLocation)
    }
}
