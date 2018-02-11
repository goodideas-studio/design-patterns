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
  var hpVal: Int
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
    actionDelegate?.actionDidSelect(actorAction: action)
  }
  
  func resetCharacter() {
    self.hpVal = 100
  }
}

class Titan: Character {
  init() {
    super.init(hpVal: 2500, atkVal: 250, name: "Titan")
//    self.resetCharacter()
  }
  
//  func resetCharacter() {
//    self.hpVal = 2500
//  }
  
  override func resetCharacter() {
    self.hpVal = 2500
  }
}

class Apollo: Character {
  init() {
    super.init(hpVal: 1500, atkVal: 150, name: "Apollo")
  }
  
  override func resetCharacter() {
    self.hpVal = 1500
  }
}

class Mars: Character {
  init() {
    super.init(hpVal: 1500, atkVal: 180, name: "Mars")
  }
  
  override func resetCharacter() {
    self.hpVal = 1500
  }
}

class Neptunus: Character {
  init() {
    super.init(hpVal: 1900, atkVal: 200, name: "Neptunus")
  }
  
  override func resetCharacter() {
    self.hpVal = 1900
  }
}

class Jupiter: Character {
  init() {
    super.init(hpVal: 2000, atkVal: 210, name: "Jupiter")
  }
  
  override func resetCharacter() {
    self.hpVal = 2000
  }
}
