//
//  File.swift
//  Game03
//
//  Created by 高菘駿 on 2018/2/26.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

class Character {
    var name: String
    var HP: Int
    var maxHP: Int
    var MP: Int
    var maxMP: Int
    var ATK: Int
    var DEF: Int
    var reward: Int
    
    init (name: String, HP: Int, maxHP: Int, MP: Int, maxMP: Int, ATK: Int, DEF: Int, reward: Int) {
        self.name = name
        self.HP = HP
        self.maxHP = maxHP
        self.MP = MP
        self.maxMP = maxMP
        self.ATK = ATK
        self.DEF = DEF
        self.reward = reward
    }
    
    convenience init() {
        self.init(name: "unknow", HP: 1, maxHP: 1, MP: 1, maxMP: 1, ATK: 1, DEF: 1, reward: 1)
    }
    
}

class Backpack {
    static let current = Backpack()
    var backpackItems = [String]() //["red_potion", "orange_potion", "atk_potion", "def_potion"]
    
    private init() { }
    
    func addItems(itemName: String) {
        backpackItems.append(itemName)
    }
    
    func useItems(itemLocation: Int) {
        backpackItems.remove(at: itemLocation)
    }
}
