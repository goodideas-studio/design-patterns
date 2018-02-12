//
//  ViewController.swift
//  paper_scissors_stone
//
//  Created by Sonny on 2018/2/8.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    let fullSize = UIScreen.main.bounds.size
    
    @IBOutlet weak var playerHpValue: UILabel!
    @IBOutlet weak var bossHpValue: UILabel!
    
    @IBOutlet weak var playerHitLabel: UILabel!
    @IBOutlet weak var bossHitLabel: UILabel!
    @IBOutlet weak var safeLabel: UILabel!
    
    @IBOutlet weak var winImage1: UIImageView!
    
    @IBOutlet weak var winImage2: UIImageView!
    
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var bossNameLabel: UILabel!
    
    @IBOutlet weak var UIImage1: UIImageView!
    @IBOutlet weak var UIImage2: UIImageView!
    
    
    
    @IBOutlet weak var UIButton1: UIButton! //paper button
    @IBAction func UIButton1(_ sender: Any) {
        print("UIButton1 has been press")
        chosenOfPlayer = "paper"
        bossrandomchosen()
//        randomHitValue()
        hit()
        print()
        
        
        
    }
    
    @IBOutlet weak var UIButton2: UIButton! //scissors button
    @IBAction func UIButton2(_ sender: Any) {
        print("UIButton2 has been press")
        chosenOfPlayer = "scissors"
        bossrandomchosen()
//        randomHitValue()
        hit()
        print()
    }
    
    @IBOutlet weak var UIButton3: UIButton! //stone button
    @IBAction func UIButton3(_ sender: Any) {
        chosenOfPlayer = "stone"
        bossrandomchosen()
//        randomHitValue()
        hit()
        print()
    }
    
    @IBOutlet weak var UIButton4: UIButton! //
    @IBAction func UIButton4(_ sender: Any) {
        reset()
    }
    
    
    @IBOutlet weak var UIButton5: UIButton!
    @IBAction func UIButton5(_ sender: Any) {
        
//        switchCharacter()
    }
    
    
    var chosenOfPlayer:String?
    var chosenOfBoss:String?
    var pss = ["paper","scissors","stone"]
    var characternames = ["batman","ironman","joker"]
    var player:String?
    let batman = Batman()
    let joker = Joker()
    let ironman = Ironman()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaultLayoutSetting()
        
    }//endofthe viewDidLoad()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Layout Setting
    func defaultLayoutSetting() {
        
        bossHpValue.text = String(joker.hp)
        playerHpValue.text = String(batman.hp)
        playerHitLabel.alpha = 0
        bossHitLabel.alpha = 0
        safeLabel.alpha = 0
        winImage1.alpha = 0
        winImage2.alpha = 0
        playerNameLabel.text = batman.name
        bossNameLabel.text = joker.name

        UIImage1.image = UIImage(named:batman.imageName)
        UIImage2.image = UIImage(named:joker.imageName)
        winImage1.image = UIImage(named:"win.png")
        winImage2.image = UIImage(named:"win.png")
        
        UIButton1.setImage(#imageLiteral(resourceName: "paper.png"), for: .normal)
        UIButton1.tintColor = UIColor.red
        
        UIButton2.setImage(#imageLiteral(resourceName: "scissors.png"), for: .normal)
        UIButton2.tintColor = UIColor.red
        UIButton3.setImage(#imageLiteral(resourceName: "stone.png"), for: .normal)
        UIButton3.tintColor = UIColor.red
        
//        UIButton4.setImage(UIImage(named:"reset.png"), for: .normal)
//        UIButton4.tintColor = UIColor.red
        UIButton4.setTitle("RESET", for: .normal)
        
        UIButton5.alpha = 0
        
        
        
    }//endofthe defaultLayoutSetting()

    //compare
    func hit() {
        if joker.hp > 0 && batman.hp > 0 {
        switch chosenOfPlayer! {
        case "paper"://player = paper
            switch chosenOfBoss! {
                case "stone":
                    print("player = paper, bose = stone , player win ")
                    joker.hp -= batman.hitvlaue
                    bossHpValue.text = String(joker.hp)
//                    hitLabelFadeInOut()
//                    self.bossHitLabel.alpha = 1
                case "scissors":
                    print("player = paper , boss = scissors , boss WIN ")
                    batman.hp -= joker.hitvlaue
                    playerHpValue.text = String(batman.hp)
//                    hitLabelFadeInOut()
//                    self.playerHitLabel.alpha = 1
                default:
                    print("平手")
            }
        case "scissors"://player = scissors
            switch chosenOfBoss! {
            case "paper":
                print("player = scissors, bose = paper , player win ")
                joker.hp -= batman.hitvlaue
                bossHpValue.text = String(joker.hp)
            case "stone":
                print("player = scissors , boss = stone , boss WIN ")
                batman.hp -= joker.hitvlaue
                playerHpValue.text = String(batman.hp)
            default:
                print("平手")
            }
            default://player = stone
                switch chosenOfBoss! {
                case "paper":
                    print("player = stone , boss = paper , player WIN ")
                    batman.hp -= joker.hitvlaue
                    playerHpValue.text = String(batman.hp)
                case "scissors":
                    print("player = stone , boss = scissors , player WIN ")
                    joker.hp -= batman.hitvlaue
                    bossHpValue.text = String(joker.hp)
                default:
                    print("平手")
            }
            }//endofthe switch
        }else if joker.hp <= 0{
            joker.hp = 0
            bossHpValue.text = String(joker.hp)
            UIButton1.isHidden = true
            UIButton2.isHidden = true
            UIButton3.isHidden = true
            winImage1.alpha = 1
            
        }else {
            batman.hp = 0
            playerHpValue.text = String(batman.hp)
            UIButton1.isHidden = true
            UIButton2.isHidden = true
            UIButton3.isHidden = true
            winImage2.alpha = 1
            
        }
}//endofthe hit()
    
    //random chosem from boss
    func bossrandomchosen() {
        let randomDistribution = GKRandomDistribution(lowestValue:0,highestValue: pss.count-1)
        for _ in 0..<pss.count {
            let index = randomDistribution.nextInt()
            chosenOfBoss = pss[index]
            print("boss choose \(chosenOfBoss)")
        }
    }//endofthe bossrandomchosen
    
    
    
    
    func reset() {

        playerHpValue.text = String(batman.defaulthp)
        bossHpValue.text = String(joker.defaulthp)
        joker.hp = joker.defaulthp
        batman.hp = batman.defaulthp
        UIButton1.isHidden = false
        UIButton2.isHidden = false
        UIButton3.isHidden = false
        winImage2.alpha = 0
        winImage1.alpha = 0
    }
    
    
    
//        func switchCharacter() {
//            let shuffledDistribution = GKShuffledDistribution(lowestValue:0,highestValue: characternames.count-1)
//            for i in 0..<characternames.count {
//                let index = shuffledDistribution.nextInt()
//
//                player = characternames[index]
//                print("\(player)")
//
//            }
//    }//endofthe switchCharacter
    
//    func randomHitValue() {
//        let randomDistribution = GKRandomDistribution(lowestValue:100,highestValue: 300)
//        var randomhit = randomDistribution.nextInt()
//    }//endofthe randomHitValue
    
    
    
//    func hitLabelFadeInOut() {
//
//        UIView.animate(withDuration: 0.5, animations: {
//            self.bossHitLabel.alpha = 1
//            })
//
//    }
    
    
   
    
}//endofthe class
