//
//  ViewController.swift
//  SmallGame
//
//  Created by EthanLin on 2018/2/8.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player:Player!
    
    var boss:Boss!
    
    let boss1 = Boss(bossHp: 2000)
    
//    let boss2 = Boss(bossHp: 2500)
    
    let player1 = Player(HP: 1600, atk: 400, playerImageName: "Player1", playerAtkImageName: "Player1Atk", playerDefImageName: "Player1Def", playerCunImageName: "Player1Cun")
    
    let player2 = Player(HP: 2000, atk: 200, playerImageName: "Player2", playerAtkImageName: "Player2Atk", playerDefImageName: "Player2Def", playerCunImageName: "Player2Cun")
    
    let gameLogic = GameLogic()
    
    @IBAction func switchCharacter(_ sender: UIButton) {
        if player === player1{
            switchCharacter(player: player2)
            player = player2
        }else {
            switchCharacter(player: player1)
            player = player1
        }
    
    }
    
    //MARK: Player
    @IBOutlet weak var playerImageView: UIImageView!
    
    @IBOutlet weak var atkValueLabel: UILabel!
    
    @IBOutlet weak var playerHPLabel: UILabel!
    
    @IBAction func attack(_ sender: UIButton) {
        
        gameLogic.gameRule(player: player, playerChoice: "Atk", boss: boss)
        
//        playerImageView.image = UIImage(named: player.playerAtkImageName)
//        atkValueLabel.text = "Atk: \(player.atk)"
//        playerChoice = choice.playerChoice[0]
//        gameRule(player: player, playerChoice: playerChoice!)
        
    }
    
    
    @IBAction func defence(_ sender: UIButton) {
        
        gameLogic.gameRule(player: player, playerChoice: "Def", boss: boss)
        
//        playerImageView.image = UIImage(named: player.playerDefImageName)
//        atkValueLabel.text = "Player Defence"
//        playerChoice = choice.playerChoice[1]
//        gameRule(player: player, playerChoice: playerChoice!)
        
        
    }
    
    @IBAction func counter(_ sender: UIButton) {
        
        gameLogic.gameRule(player: player, playerChoice: "Cun", boss: boss)
        
//        playerImageView.image = UIImage(named: player.playerCunImageName)
//        atkValueLabel.text = "Player Counter"
//        playerChoice = choice.playerChoice[2]
//        gameRule(player: player, playerChoice: playerChoice!)
        
    }
    
    
    
    //MARK Boss
    @IBOutlet weak var bossHPLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boss = boss1
        player = player1
        playerImageView.image = UIImage(named: player1.playerImageName)
        playerHPLabel.text = "HP" + ": " + String(player1.HP)
        bossHPLabel.text = "HP" + ": " + "2000"
        atkValueLabel.text = ""
        gameLogic.delegate = self
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //MARK Game rule判斷輸贏
//    func gameRule(player: Player, playerChoice:String){
//        //Boss隨機取出一個模式
//        let choice = Choices()
//        let bossChoiceIndex = Int(arc4random_uniform(UInt32(choice.bossChoice.count)))
//        let bossChoice = choice.bossChoice[bossChoiceIndex]
//
//        if playerChoice == "Atk" && bossChoice == "Cun"{
//            bossHPLabel.text = "HP: \(boss1.bossHp - player.atk)"
//            boss1.bossHp = Int(boss1.bossHp-player.atk)
//        }else if playerChoice == "Def" && bossChoice == "Cun"{
//            playerHPLabel.text = "HP: \(player.HP - player.atk)"
//            player.HP = player.HP - player.atk
//        }else if playerChoice == "Atk" && bossChoice == "Def"{
//            playerHPLabel.text = "HP: \(player.HP - player.atk)"
//            player.HP = player.HP - player.atk
//        }else if playerChoice == "Cun" && bossChoice == "Def"{
//            bossHPLabel.text = "HP: \(boss1.bossHp - player.atk)"
//            boss1.bossHp = Int(boss1.bossHp-player.atk)
//        }else if playerChoice == "Def" && bossChoice == "Atk"{
//            bossHPLabel.text = "HP: \(boss1.bossHp - player.atk)"
//            boss1.bossHp = Int(boss1.bossHp-player.atk)
//        }else if playerChoice == "Cun" && bossChoice == "Atk"{
//            playerHPLabel.text = "HP: \(player.HP - player.atk)"
//            player.HP = player.HP - player.atk
//        }
////        resetScreen(boss: boss1, player: player)
//    }

    func switchCharacter(player:Player){
        playerImageView.image = UIImage(named: player.playerImageName)
        playerHPLabel.text = "HP: \(player.HP)"
        atkValueLabel.text = ""
        
    }
    

    
//    func resetScreen(boss: Boss, player: Player){
//        if boss.bossHp == 0{
//            bossHPLabel.text = "HP: 0"
//            boss.bossHp = 2000
//            bossHPLabel.text = "HP: \(boss.bossHp)"
//        }
//        if player.HP == 0{
//            playerHPLabel.text = "HP: 0"
//            if player === player1{
//                player.HP = 1600
//                playerHPLabel.text = "HP: \(player.HP)"
//            }else if player === player2{
//                player.HP = 2000
//                playerHPLabel.text = "HP: \(player.HP)"
//            }
//        }
//
//    }
}
extension ViewController: showDataDelegate{
    
    
    func showPlayerImageViewByAction(action: String) {
        playerImageView.image = UIImage(named: action)
    }
    
    func showPlayerHPLabel(value: Int) {
        playerHPLabel.text = "HP: \(value)"
    }
    
    func showBossHPLabel(value: Int) {
        bossHPLabel.text = "HP: \(value)"
    }
    
    func showAtkLabel(playerChoice:String) {
        atkValueLabel.text = playerChoice
    }
    
    
}
