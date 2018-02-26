//
//  File.swift
//  Game02
//
//  Created by 高菘駿 on 2018/2/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

enum ActionEnum {
    case ATK, MATK, DEF
}

class Character {
    
    var HP: Int
    var MP: Int
    var damage: Int
    //var actionImage: UIImage
    
    @objc init(HP: Int, MP: Int, damage: Int) {
        self.HP = HP
        self.MP = MP
        self.damage = damage
        //self.actionImage = UIImageView(named: ActionEnum)!
    }
}
