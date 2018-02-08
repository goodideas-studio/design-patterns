//
//  GameBoard.swift
//  Game01
//
//  Created by 高菘駿 on 2018/2/8.
//  Copyright © 2018年 SoJ. All rights reserved.
//
import UIKit
import Foundation

protocol showDataDelegate {
//    func monsterAttack()
//    func playerAttack()
    func showAction(action: String)
    func showHP(playerHP: Int, monsterHP: Int)
    func showLose(lose: String)
    func showWin(win: String)
}

class GameBoard {
    var playerCharacter = PlayerAbility(hp: 2000, atk: 100, imageName: ["攻擊", "防禦", "反擊"])
    let monsterCharacter = MonsterAbility (hp: 2000, atk: 100, imageName: "boss1")
    var delegate: showDataDelegate?
    
    func fight(playerAction: String) {
        
        let monsterSkill = ["ATK", "DEF", "SQU"]
        let monsterAction = monsterSkill[Int(arc4random_uniform(UInt32(monsterSkill.count)))]
        
        let fight = (player: playerAction, monster: monsterAction)
        switch fight {
    
        case ("ATK", "DEF"):
            delegate?.showAction(action: playerCharacter.imageName[0])
            monsterAttack()
            print("monster win!!")
            
        case ("ATK", "SQU"):
            delegate?.showAction(action: playerCharacter.imageName[0])
            playerAttack()
            print("player win!!")
            
        case ("DEF", "ATK"):
            delegate?.showAction(action: playerCharacter.imageName[1])
            playerAttack()
            print("player win!!")
            
        case ("DEF", "SQU"):
            delegate?.showAction(action: playerCharacter.imageName[1])
            monsterAttack()
            print("monster win!!")
            
        case ("SQU", "ATK"):
            delegate?.showAction(action: playerCharacter.imageName[2])
            monsterAttack()
            print("monster win!!")
        
        case ("SQU", "DEF"):
            delegate?.showAction(action: playerCharacter.imageName[2])
            playerAttack()
            print("player win!!")
            
        default:
            print("平手")
        }
    }
    
    func playerAttack() {
        monsterCharacter.hp -= 1 * playerCharacter.atk
        if monsterCharacter.hp <= 0 {
            monsterCharacter.hp = 0
            winGame()
        }
        delegate?.showHP(playerHP: playerCharacter.hp, monsterHP: monsterCharacter.hp)
    }
    
    func monsterAttack() {
        
        playerCharacter.hp -= 1 * monsterCharacter.atk
        if playerCharacter.hp <= 0 {
            playerCharacter.hp = 0
            loseGame()
        }
        delegate?.showHP(playerHP: playerCharacter.hp, monsterHP: monsterCharacter.hp)
    }

    func switchCharacter() {
        
        playerCharacter = PlayerAbility(hp: 1000, atk: 500, imageName: ["招喚師攻擊", "招喚師防禦", "招喚師反擊"])
        delegate?.showHP(playerHP: playerCharacter.hp, monsterHP: monsterCharacter.hp)
        delegate?.showAction(action: playerCharacter.imageName[0])
    }
    
    func loseGame() {
        print("You Lose!!")
        delegate?.showLose(lose: "You Lose!!")
    }
    
    func winGame() {
        print("You Win!!")
        delegate?.showWin(win: "You Win!!")
    }
    
}
