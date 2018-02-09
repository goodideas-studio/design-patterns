//
//  Character.swift
//  Game
//
//  Created by PinguMac on 2018/2/8.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation
import UIKit

class Character {
  let hpVal: Int
  let atkVal: Int
  let name: String
  let headShot: UIImage

  init(hpVal: Int, atkVal: Int, name: String) {
    self.hpVal = hpVal
    self.atkVal = atkVal
    self.name = name
    self.headShot = UIImage(named: name)!
  }

  weak var delegate: UpdateCharacterInfo?

  func showPlayer(action: Int) {
    delegate?.updatePlayerInfo(hpVal: hpVal, atkVal: atkVal, name: name)
    delegate?.updatePlayerImg(action: action, image: headShot)
  }
  
  func showBoss(action: Int) {
    delegate?.updateBossInfo(hpVal: hpVal, atkVal: atkVal, name: name)
    delegate?.updateBossImg(action: action, image: headShot)
  }
}

class Titan: Character {
  init() {
    super.init(hpVal: 2500, atkVal: 250, name: "Titan")
  }
}

class Apollo: Character {
  init() {
    super.init(hpVal: 1500, atkVal: 100, name: "Apollo")
  }
}

class Mars: Character {
  init() {
    super.init(hpVal: 1500, atkVal: 180, name: "Mars")
  }
}

class Neptunus: Character {
  init() {
    super.init(hpVal: 1600, atkVal: 110, name: "Neptunus")
  }
}

class Jupiter: Character {
  init() {
    super.init(hpVal: 2000, atkVal: 200, name: "Jupiter")
  }
}
