//
//  File.swift
//  Game01
//
//  Created by 高菘駿 on 2018/2/8.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation


class PlayerAbility {
    
    var hp: Int = 2000
    var atk: Int = 200
    var imageName: [String] = []
    
    init(hp:Int,atk:Int, imageName: [String]) {
        self.hp = hp
        self.atk = atk
        self.imageName = imageName
    }
    
}

class MonsterAbility {
    
    var hp: Int = 2000
    var atk: Int = 200
    var imageName: String = "boss1"
    
    init(hp:Int,atk:Int, imageName:String) {
        self.hp = hp
        self.atk = atk
        self.imageName = imageName
    }
    
}
