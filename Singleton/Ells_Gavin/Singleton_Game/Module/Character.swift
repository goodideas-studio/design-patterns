//
//  Character.swift
//  Singleton_Game
//
//  Created by PinguMac on 2018/2/27.
//  Copyright © 2018年 唐嘉伶. All rights reserved.
//

import Foundation

class Character {
  var ATK: Int
  var DEF: Int
  var HP: Int
  var MP: Int
  
  init(ATK: Int, DEF: Int, HP: Int, MP: Int) {
    self.ATK = ATK
    self.DEF = DEF
    self.HP = HP
    self.MP = MP
  }
}
