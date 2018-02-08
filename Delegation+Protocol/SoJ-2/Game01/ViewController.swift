//
//  ViewController.swift
//  Game01
//
//  Created by 高菘駿 on 2018/2/8.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, showDataDelegate {

    @IBOutlet var playerImageView: UIImageView!
    @IBOutlet var playerHPLabel: HpLabel!
    @IBOutlet var monsterImageView: UIImageView!
    @IBOutlet var monsterHPLabel: HpLabel!
    @IBOutlet var gameLabel: UILabel!
    
    let gameBoard = GameBoard()
    var gameRound: String?
    
    
    @IBAction func attack(_ sender: Any) {
        //showAction(action: "攻擊")
        //playerImageView.image = UIImage(named:"攻擊")
//        monsterAction = monsterSkill[Int(arc4random_uniform(UInt32(monsterSkill.count)))]
        gameBoard.fight(playerAction: "ATK")
        
    }
    @IBAction func defense(_ sender: Any) {
        //showAction(action: "防禦")
        //playerImageView.image = UIImage(named:"防禦")
        gameBoard.fight(playerAction: "DEF")
    }
    @IBAction func squelch(_ sender: Any) {
        //showAction(action: "反擊")
        //playerImageView.image = UIImage(named:"反擊")
        gameBoard.fight(playerAction: "SQU")
        
    }
    
    @IBAction func switchCharacter(_ sender: Any) {
        //playerHPLabel.text = "1000"
       // playerImageView.image = UIImage(named:"招喚師攻擊")
        gameBoard.switchCharacter()
//        showHP(playerHP: <#T##Int#>, monsterHP: <#T##Int#>)
        
    }
    func showAction(action: String) {
        playerImageView.image = UIImage(named: action)
    }
    func showHP(playerHP: Int, monsterHP: Int) {
        playerHPLabel.text = "HP: \(String(playerHP))"
        monsterHPLabel.text = "HP: \(String(monsterHP))"
    }
    
    func showLose(lose: String) {
        gameLabel.text = lose
    }
    
    func showWin(win: String) {
        gameLabel.text = win
    }

//    let playerCharacter = PlayerAbility()
//    let monsterCharacter = MonsterAbility()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameBoard.delegate = self
        showHP(playerHP: 2000, monsterHP: 2000)
//        playerHPLabel.text = "HP: \(playerCharacter.hp)"
//        playerImageView.image = UIImage(named: playerCharacter.imageName)
//        monsterHPLabel.text = "HP: \(monsterCharacter.hp)"
//        monsterImageView.image = UIImage(named: monsterCharacter.imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

