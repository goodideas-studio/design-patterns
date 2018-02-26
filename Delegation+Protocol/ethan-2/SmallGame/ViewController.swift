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
        
    }
    
    
    @IBAction func defence(_ sender: UIButton) {
        
        gameLogic.gameRule(player: player, playerChoice: "Def", boss: boss)

    }
    
    @IBAction func counter(_ sender: UIButton) {
        
        gameLogic.gameRule(player: player, playerChoice: "Cun", boss: boss)
        
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

    


    func switchCharacter(player:Player){
        playerImageView.image = UIImage(named: player.playerImageName)
        playerHPLabel.text = "HP: \(player.HP)"
        atkValueLabel.text = ""
    }
    

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
