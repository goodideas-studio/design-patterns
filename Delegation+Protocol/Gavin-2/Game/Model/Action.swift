//
//  Action.swift
//  Game
//
//  Created by PinguMac on 2018/2/9.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

enum ActionResult {
  case Tie
  case Win
  case Lose
}

protocol Action {
  var name: String { get }
}

class Attack: Action {
  var name = "attack"
}

class Defence: Action {
  var name = "defence"
}

class CounterAttack: Action {
  var name = "counterattack"
}

protocol ActionDelegate: class {
  func actionDidSelect(actorAction: Action)
}

