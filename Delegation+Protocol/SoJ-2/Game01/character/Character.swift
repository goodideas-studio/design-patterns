//
//  File.swift
//  Game01
//
//  Created by 高菘駿 on 2018/2/8.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

class CharacterAbility {
    
    var level: Int  // flee +1, DEF +1 / 2, AD & AP +10 / 4, MDF +1 / 4
    var job: String
    var exp: Int
    var hp: Int
    var mp: Int
    var str: Int    //strength 力量 : AD +10, DEF +1
    var vit: Int    //vitality 體質 : max HP +1%, DEF & MDEF +2
    var int: Int    //intelligence 智力 : AP +15, MDEF +1
    var agi: Int    //agility 敏捷 : flee +1
    var skill: [String]     //技能
    var imageName: String   //攻擊圖片
    
    init(level: Int,job: String,exp: Int, hp: Int, mp: Int, str: Int, vit: Int, int: Int, agi: Int,skill: [String], imageName: String) {
        
        self.level = level
        self.job = job
        self.exp = exp
        self.hp = hp
        self.mp = mp
        self.str = str
        self.vit = vit
        self.int = int
        self.agi = agi
        self.skill = skill
        self.imageName = imageName
    }
    
}

class CharacterAttribute {
  
    var levelUpExp: Int
    var maxHp: Int
    var maxMp: Int
    var ATK: Int
    var MATK: Int
    var DEF: Int
    var MDEF: Int
    var FLEE: Int
    
    init(levelUpExp: Int, maxHp: Int, maxMp: Int, ATK: Int, MATK: Int, DEF: Int, MDEF: Int, FLEE: Int) {
        
        self.levelUpExp = levelUpExp
        self.maxHp = maxHp
        self.maxMp = maxMp
        self.ATK = ATK
        self.MATK = MATK
        self.DEF = DEF
        self.MDEF = MDEF
        self.FLEE = FLEE
    }
//    var characterAbility: CharacterAbility? {
//        didSet {
//            if let character = characterAbility {
//                //升級經驗值
//                var levelUpExp: Int = character.level * 100
//                //物理傷害
//                var ATK: Int = character.str * 10 + Int(round(Double(character.level/4))) * 10
//                //魔法傷害
//                var MATK: Int = character.int * 15 + character.level * 10
//                //物理防禦
//                var DEF: Int = character.vit * 2 + character.str + character.level * 2
//                //魔法防禦
//                var MDEF: Int = character.vit * 2 + character.int + character.level / 4
//                //閃避
//                var FLEE: Int = character.agi + character.level
//            }
//
//        }
}

//class PlayerAbility {
//    
//    var hp: Int = 2000
//    var atk: Int = 200
//    var imageName: [String] = []
//    
//    init(hp:Int,atk:Int, imageName: [String]) {
//        self.hp = hp
//        self.atk = atk
//        self.imageName = imageName
//    }
//    
//}
//
//class MonsterAbility {
//    
//    var hp: Int = 2000
//    var atk: Int = 200
//    var imageName: String = "boss1"
//    
//    init(hp:Int,atk:Int, imageName:String) {
//        self.hp = hp
//        self.atk = atk
//        self.imageName = imageName
//    }
//    
//}

