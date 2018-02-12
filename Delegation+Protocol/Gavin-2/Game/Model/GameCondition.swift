//
//  GameControll.swift
//  Game
//
//  Created by PinguMac on 2018/2/9.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

protocol GameRule {
  static func execute(actorAction: Action, bossAction: Action) -> ActionResult
}

class GameCondition: GameRule {
  static let rules: [String: ActionResult] = [
    "\(String(describing: Attack.self))_\(String(describing: Defence.self))": ActionResult.Lose,
    "\(String(describing: Attack.self))_\(String(describing: CounterAttack.self))": ActionResult.Win,
    "\(String(describing: Defence.self))_\(String(describing: Attack.self))": ActionResult.Win,
    "\(String(describing: Defence.self))_\(String(describing: CounterAttack.self))": ActionResult.Lose,
    "\(String(describing: CounterAttack.self))_\(String(describing: Attack.self))": ActionResult.Lose,
    "\(String(describing: CounterAttack.self))_\(String(describing: Defence.self))": ActionResult.Win]

  static func execute(actorAction: Action, bossAction: Action) -> ActionResult {
    if let result = rules["\(String(describing: actorAction).components(separatedBy: ".").last!)_\(String(describing: bossAction).components(separatedBy: ".").last!)"] {
      return result
    }
    
    return .Tie
  }
  
}
