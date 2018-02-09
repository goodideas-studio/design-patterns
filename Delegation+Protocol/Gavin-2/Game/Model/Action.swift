//
//  Action.swift
//  Game
//
//  Created by PinguMac on 2018/2/9.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

enum ActionResult {
  case Tie, ActorWin, ActorLose
}

protocol Action {
  var name: String { get }
}

class Paper: Action {
  var name = "attack"
}

class Scissors: Action {
  var name = "defence"
}

class Stone: Action {
  var name = "counterattack"
}

protocol ActionDelegate: class {
  func actionDidSelect(action: Action)
}

