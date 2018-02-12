//
//  GameLogic.swift
//  SmallGame
//
//  Created by EthanLin on 2018/2/10.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation


protocol showDataDelegate{
    func showPlayerImageViewByAction(action: String)
    func showPlayerHPLabel(value:Int)
    func showBossHPLabel(value:Int)
    func showAtkLabel(playerChoice:String)
    
}

class GameLogic{
    
    var delegate:showDataDelegate?
    
    
    func gameRule(player: Player, playerChoice:String, boss:Boss){
        //Boss隨機取出一個模式
        let choice = Choices()
        let bossChoiceIndex = Int(arc4random_uniform(UInt32(choice.bossChoice.count)))
        let bossChoice = choice.bossChoice[bossChoiceIndex]
        
        let fight = (playerChoice, bossChoice)
        
        switch fight {
        case ("Atk","Cun"):
            delegate?.showPlayerImageViewByAction(action: player.playerAtkImageName)
            delegate?.showBossHPLabel(value: boss.bossHp - player.atk)
            delegate?.showAtkLabel(playerChoice: "Atk: \(player.atk)")
            boss.bossHp = boss.bossHp - player.atk
            print("Boss扣血")
        case ("Def","Cun"):
            delegate?.showPlayerImageViewByAction(action: player.playerDefImageName)
            delegate?.showPlayerHPLabel(value: player.HP - player.atk)
            delegate?.showAtkLabel(playerChoice: "Player Defence")
            player.HP = player.HP - player.atk
            print("玩家扣血")
        case ("Atk","Def"):
            delegate?.showPlayerImageViewByAction(action: player.playerAtkImageName)
            delegate?.showPlayerHPLabel(value: player.HP - player.atk)
            delegate?.showAtkLabel(playerChoice: "Atk: \(player.atk)")
            player.HP = player.HP - player.atk
            print("玩家扣血")
        case ("Cun","Def"):
            delegate?.showPlayerImageViewByAction(action: player.playerCunImageName)
            delegate?.showBossHPLabel(value: boss.bossHp - player.atk)
            delegate?.showAtkLabel(playerChoice: "Player Cunter")
            boss.bossHp = boss.bossHp - player.atk
            print("Boss扣血")
        case ("Def","Atk"):
            delegate?.showPlayerImageViewByAction(action: player.playerDefImageName)
            delegate?.showBossHPLabel(value: boss.bossHp - player.atk)
            delegate?.showAtkLabel(playerChoice: "Player Defence")
            boss.bossHp = boss.bossHp - player.atk
            print("Boss扣血")
        case ("Cun","Atk"):
            delegate?.showPlayerImageViewByAction(action: player.playerCunImageName)
            delegate?.showPlayerHPLabel(value: player.HP - player.atk)
            delegate?.showAtkLabel(playerChoice: "Player Cunter")
            player.HP = player.HP - player.atk
            print("玩家扣血")
        default:
            print("平手")
            switch playerChoice{
            case "Atk":
                delegate?.showPlayerImageViewByAction(action: player.playerAtkImageName)
                delegate?.showAtkLabel(playerChoice: "Atk: \(player.atk)")
            case "Def":
                delegate?.showPlayerImageViewByAction(action: player.playerDefImageName)
                delegate?.showAtkLabel(playerChoice: "Player Defence")
            default:
                delegate?.showPlayerImageViewByAction(action: player.playerCunImageName)
                delegate?.showAtkLabel(playerChoice: "Player Cunter")
            }
            
        }
        

        
    }

}
