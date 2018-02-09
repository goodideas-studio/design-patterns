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

  weak var infoDelegate: UpdateCharacterInfo?
  weak var actionDelegate: ActionDelegate?

  func showPlayer() {
    infoDelegate?.updatePlayerInfo(hpVal: hpVal, atkVal: atkVal, name: name)
    infoDelegate?.updatePlayerImg(image: headShot)
  }
  
  func showBoss() {
    infoDelegate?.updateBossInfo(hpVal: hpVal, atkVal: atkVal, name: name)
    infoDelegate?.updateBossImg(image: headShot)
  }
  
  func action(action: Action) {
    actionDelegate?.actionDidSelect(action: action)
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
