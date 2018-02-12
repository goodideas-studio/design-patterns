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

    func showAction(action: String)
    func showHP(playerHP: Int, monsterHP: Int, playerHPRatio: Double, monsterHPRatio: Double)
    func showMP(playerMP: Int, monsterMP: Int, playerMPRatio: Double, monsterMPRatio: Double)
    func showLose(lose: String)
    func showWin(win: String)
//    func monsterAttackAnimate(atkType: String)
//    func playerAttackAnimate(atkType: String)
}

class GameBoard {
    
//角色初始化
    var playerAbility: CharacterAbility!
    var playerAttribute: CharacterAttribute!
//怪物初始化
    var monsterAbility: CharacterAbility!
    
    var monsterAttribute: CharacterAttribute!

//戰士初始化
    var warriorAbility = CharacterAbility(level: 1, job: "warrior", exp: 0, hp: 50, mp: 10, str: 5, vit: 5, int: 1, agi: 5,skill: ["warrior"], imageName: "warrior")
    var warriorAttribute = CharacterAttribute(levelUpExp: 1, maxHp: 1, maxMp: 1, ATK: 1, MATK: 1, DEF: 1, MDEF: 1, FLEE: 1)
//法師初始化
    var magicianAbility = CharacterAbility(level: 1, job: "magician", exp: 0, hp: 20, mp: 100, str: 2, vit: 2, int: 10, agi: 2, skill: ["magician"], imageName: "magician")
    var magicianAttribute = CharacterAttribute(levelUpExp: 1, maxHp: 1, maxMp: 1, ATK: 1, MATK: 1, DEF: 1, MDEF: 1, FLEE: 1)
//DeadGod初始化
    var DeadGodAbility = CharacterAbility(level: 10, job: "stage1Boss", exp: 500, hp: 100, mp: 50, str: 5, vit: 10, int: 5, agi: 5, skill: ["DeadGad"], imageName: "DeadGad")
    
    var DeadGodAttribute = CharacterAttribute(levelUpExp: 1, maxHp: 1, maxMp: 1, ATK: 1, MATK: 1, DEF: 1, MDEF: 1, FLEE:1)

    
    var delegate: showDataDelegate?
    
//Boss動作回合
    var monsterActRound = 5

    func fight(playerAction: String) {
        switch playerAction {
        case "ATK":
            playerAttack(atkType: playerAction)
        case "MATK":
            print("玩家使用魔法攻擊(未實作)")
        case "HEAL":
            print("玩家補血(未實作)")
        default: break
        }
        monsterActRound -= 1
        if monsterActRound == 0 {
            monsterActRound = 5
            let monsterAtkType = ["ATK", "DEF", "HEAL"]
            let monsterAction = monsterAtkType[Int(arc4random_uniform(UInt32(monsterAtkType.count)))]
            switch monsterAction {
            case "ATK":
                monsterAttack(atkType: monsterAction)
            case "DEF":
                print("怪物防禦")
            case "HEAL":
                print("怪物治療")
            default: break
            }
        }
        print(monsterActRound)
    }
    
    func playerAttack(atkType: String) {
        var damage = 0
        if atkType == "ATK" {
            damage = playerAttribute.ATK
        } else if atkType == "MATK" {
            damage = playerAttribute.MATK
            decreasedMana(skillName: "玩家魔法攻擊")
        }
//notification sample
        NotificationCenter.default.post(name: .playerAttackAnimate, object: nil)
//delegate sample
        //delegate?.playerAttackAnimate(ataType: String)
        monsterAbility.hp = max (monsterAbility.hp - damage, 0)
        delegate?.showHP(playerHP: playerAbility.hp, monsterHP: monsterAbility.hp, playerHPRatio: Double(playerAbility.hp) / Double(playerAttribute.maxHp), monsterHPRatio: Double(monsterAbility.hp) / Double(monsterAttribute.maxHp))
        delegate?.showWin(win: "You Attack!! Moster lose \(damage)")
    }
    
    func monsterAttack(atkType: String) {
        var damage = 0
        if atkType == "ATK" {
            damage = monsterAttribute.ATK
        } else if atkType == "MATK" {
            damage = monsterAttribute.MATK
            decreasedMana(skillName: "怪物魔法攻擊")
        }
        playerAbility.hp -= damage
        if playerAbility.hp <= 0 {
            playerAbility.hp = 0
            loseGame()
        }
//notification sample
        NotificationCenter.default.post(name: .monsterAttackAnimate, object: nil)
//delegate sample
        //delegate?.monsterAttackAnimate(ataType: String)
        delegate?.showHP(playerHP: playerAbility.hp, monsterHP: monsterAbility.hp, playerHPRatio: Double(playerAbility.hp) / Double(playerAttribute.maxHp), monsterHPRatio: Double(monsterAbility.hp) / Double(monsterAttribute.maxHp))
        delegate?.showLose(lose: "Moster Attack!! You lose \(damage)")
    }

//切換角色
    func switchCharacter() {
        if playerAbility.job == "warrior" {
            playerAbility = magicianAbility
        } else if playerAbility.job == "magician" {
            playerAbility = warriorAbility
        }
        playerAttribute = calculateAttribute(character: playerAbility)
        delegate?.showHP(playerHP: playerAbility.hp, monsterHP: monsterAbility.hp, playerHPRatio: Double(playerAbility.hp) / Double(playerAttribute.maxHp), monsterHPRatio: Double(monsterAbility.hp) / Double(monsterAttribute.maxHp))
        delegate?.showMP(playerMP: playerAbility.mp, monsterMP: monsterAbility.mp, playerMPRatio: Double(playerAbility.mp / playerAttribute.maxMp), monsterMPRatio: Double(monsterAbility.mp / monsterAttribute.maxMp))
        delegate?.showAction(action: playerAbility.imageName)
        
        }
 
//魔力損耗
    func decreasedMana(skillName: String) {
        switch skillName {
        case "玩家魔法攻擊":
            playerAbility.mp -= 5
        case "怪物魔法攻擊":
            monsterAbility.mp -= 5
        default:
            break
        }
        delegate?.showMP(playerMP: playerAbility.mp, monsterMP: monsterAbility.mp, playerMPRatio: Double(playerAbility.mp / playerAttribute.maxMp), monsterMPRatio: Double(monsterAbility.mp / monsterAttribute.maxMp))
    }
    
//計算角色屬性：攻擊力, 防禦力...
    func calculateAttribute(character: CharacterAbility) -> CharacterAttribute {
        let attribute = CharacterAttribute(levelUpExp: 1, maxHp: 1, maxMp: 1, ATK: 1, MATK: 1, DEF: 1, MDEF: 1, FLEE: 1)

        //升級經驗值
        attribute.levelUpExp = character.level * 100
        //最大HP
        attribute.maxHp = character.vit * 10
        //最大MP
        attribute.maxMp = character.int * 10
        //物理傷害
        attribute.ATK = character.str + Int(round(Double(character.level/4))) * 10
        //魔法傷害
        attribute.MATK = character.int + character.level * 10
        //物理防禦
        attribute.DEF = character.vit * 2 + character.str + Int(round(Double(character.level/2)))
        //魔法防禦
        attribute.MDEF = character.vit * 2 + character.int + Int(round(Double(character.level/4)))
        //閃避
        attribute.FLEE = character.agi + character.level
        
        return attribute
        
    }
    
    func setCharacter() {
        warriorAbility = CharacterAbility(level: 1, job: "warrior", exp: 0, hp: 50, mp: 10, str: 5, vit: 5, int: 1, agi: 5,skill: ["warrior"], imageName: "warrior")
       
        magicianAbility = CharacterAbility(level: 1, job: "magician", exp: 0, hp: 20, mp: 100, str: 2, vit: 2, int: 10, agi: 2, skill: ["magician"], imageName: "magician")
        
        DeadGodAbility = CharacterAbility(level: 10, job: "stage1Boss", exp: 500, hp: 100, mp: 50, str: 5, vit: 10, int: 5, agi: 5, skill: ["DeadGad"], imageName: "DeadGad")
        
        playerAbility = warriorAbility
        // playerAttribute = warriorAttribute
        monsterAbility = DeadGodAbility
        // monsterAttribute = DeadGodAttribute
        
        
        playerAttribute = calculateAttribute(character: playerAbility)
        monsterAttribute = calculateAttribute(character: monsterAbility)
        delegate?.showHP(playerHP: playerAbility!.hp, monsterHP: monsterAbility!.hp, playerHPRatio: Double(playerAbility.hp) / Double(playerAttribute.maxHp), monsterHPRatio: Double(monsterAbility.hp) / Double(monsterAttribute.maxHp))
        delegate?.showMP(playerMP: playerAbility.mp, monsterMP: monsterAbility.mp, playerMPRatio: Double(playerAbility.mp / playerAttribute.maxMp), monsterMPRatio: Double(monsterAbility.mp / monsterAttribute.maxMp))
        delegate?.showAction(action: warriorAbility.imageName)
    }
    
    func loseGame() {
        print("You Lose!!")
        delegate?.showLose(lose: "You lose!!")
    }
    
    func winGame() {
        print("You Win!!")
        delegate?.showWin(win: "You win!!")
    }

}
