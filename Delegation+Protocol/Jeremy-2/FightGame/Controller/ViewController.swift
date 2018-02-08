//
//  ViewController.swift
//  FightGame
//
//  Created by JeremyXue on 2018/2/8.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Boss 剪刀石頭布亂數 (1 ~ 3 =  1.剪刀 2. 石頭 3.布 )
    var bossNumber = Int(arc4random_uniform(3) + 1)
    // oihih
    // 進場自動選擇角色 Woody 用來變換角色
    var playerCharacter = "Woody"
    
    // 創建 GameMode 實例
    let gameMode = GameMode()
    let woody = Woody()
    let louis = Louis()
    let boss = Boss()
    
    var player:CharacterAction?
    
    // 顯示畫面數據
    @IBOutlet weak var playerHP: UILabel!
    @IBOutlet weak var bossHP: UILabel!
    @IBOutlet weak var result: UILabel!
    // 角色圖片
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var bossImage: UIImageView!
    
    // 三種動作按鈕
    @IBAction func attackButton(_ sender: UIButton) {
        
        if boss.hp <= 0 || (player?.hp)! <= 0{
            result.text = "比賽結束"
        } else {
            characterImage.image = UIImage(named:"\(playerCharacter)Atk")
            
            switch bossNumber {
            case 1:
                print("平手")
                self.bossImage.image = #imageLiteral(resourceName: "BossAtk")
            case 2:
                print("輸了")
                player?.hp -= boss.atk
                self.bossImage.image = #imageLiteral(resourceName: "BossDef")
            case 3:
                print("贏了")
                boss.hp -= (player?.atk)!
                self.bossImage.image = #imageLiteral(resourceName: "BossStand")
            default:
                print("未知")
            }
            updateHPandRandomNumber()
        }
        
        
        
        
        
    }
    @IBAction func defenseButton(_ sender: UIButton) {
        if boss.hp <= 0 || (player?.hp)! <= 0{
            
            result.text = "比賽結束"
        } else {
            characterImage.image = UIImage(named:"\(playerCharacter)Def")
            
            switch bossNumber {
            case 1:
                print("獲勝")
                boss.hp -= (player?.atk)!
                self.bossImage.image = #imageLiteral(resourceName: "BossAtk")
            case 2:
                print("平手")
                self.bossImage.image = #imageLiteral(resourceName: "BossDef")
            case 3:
                print("輸了")
                player?.hp -= boss.atk
                self.bossImage.image = #imageLiteral(resourceName: "BossStand")
            default:
                print("未知")
            }
            updateHPandRandomNumber()
        }

    }
    @IBAction func CounterButton(_ sender: UIButton) {
        if boss.hp <= 0 || (player?.hp)! <= 0{
            result.text = "比賽結束"
        } else {
            characterImage.image = UIImage(named:"\(playerCharacter)Stand")
            
            switch bossNumber {
            case 1:
                print("輸了")
                player?.hp -= boss.atk
                self.bossImage.image = #imageLiteral(resourceName: "BossAtk")
            case 2:
                print("獲勝")
                boss.hp -= (player?.atk)!
                self.bossImage.image = #imageLiteral(resourceName: "BossDef")
            case 3:
                print("平手")
                self.bossImage.image = #imageLiteral(resourceName: "BossStand")
            default:
                print("未知")
            }
            updateHPandRandomNumber()
        }
    }
    
    // 更換角色 + 重新遊戲
    
    @IBAction func changeCharacter(_ sender: UIButton) {
        if playerCharacter == "Woody" {
            playerCharacter = "Louis"
            player = louis
            player?.hp = 150
            characterImage.image = #imageLiteral(resourceName: "LouisStand")
            if let someHP = player?.hp {
                playerHP.text = "角色血量：\(someHP)"
            }
            boss.hp = 200
            result.text = "遊戲開始"
            bossHP.text = "魔王血量：\(boss.hp)"
        } else if playerCharacter == "Louis"{
            playerCharacter = "Woody"
            player = woody
            player?.hp = 100
            characterImage.image = #imageLiteral(resourceName: "WoodyStand")
            if let someHP = player?.hp {
                playerHP.text = "角色血量：\(someHP)"
            }
            boss.hp = 200
            result.text = "遊戲開始"
            bossHP.text = "魔王血量：\(boss.hp)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bossNumber = Int(arc4random_uniform(3) + 1)
        print(bossNumber)
        player = woody
        
        if let someHP = player?.hp {
            playerHP.text = "角色血量：\(someHP)"
        }
        bossHP.text = "魔王血量：\(boss.hp)"
    
    }
    // 重置玩家血量及亂數
    func updateHPandRandomNumber(){
        playerHP.text = "角色血量：\((player?.hp)!)"
        bossHP.text = "魔王血量:\(boss.hp)"
        bossNumber = Int(arc4random_uniform(3) + 1)
        print("bossNumber = \(bossNumber)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
