//
//  ItemUse.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/27.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation

func useItem (hp: Int, mp: Int, atk: Int, def: Int) {
    Character.shared.hp += hp
    Character.shared.mp += mp
    Character.shared.atk += atk
    Character.shared.def += def
}
