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
    @IBOutlet var playerMPLabel: HpLabel!
    @IBOutlet var monsterImageView: UIImageView!
    @IBOutlet var monsterHPLabel: HpLabel!
    @IBOutlet var monsterMPLabel: HpLabel!
    @IBOutlet var gameLabel: UILabel!
    @IBOutlet var playerAttackAnimateImageView: UIImageView!
    @IBOutlet var ｍonsterAttackAnimateImageView: UIImageView!
    
    let gameBoard = GameBoard()
    var gameRound: [String] = []
    
    
    @IBAction func attack(_ sender: Any) {
        gameBoard.fight(playerAction: "ATK")
    }
    @IBAction func magicAttack(_ sender: Any) {
        gameBoard.fight(playerAction: "MATK")
    }
    @IBAction func heal(_ sender: Any) {
        gameBoard.fight(playerAction: "HEAL")
    }
    
    @IBAction func switchCharacter(_ sender: Any) {
        gameBoard.switchCharacter()
    }
    @IBAction func reStartGame(_ sender: Any) {
        gameBoard.setCharacter()
    }
    func showAction(action: String) {
        playerImageView.image = UIImage(named: action)
    }
    func showHP(playerHP: Int, monsterHP: Int, playerHPRatio: Double, monsterHPRatio: Double) {
        playerHPLabel.text = "HP: \(String(playerHP))"
        monsterHPLabel.text = "HP: \(String(monsterHP))"
        createPlayerHPLayer(ratio: playerHPRatio)
        createMonsterHPLayer(ratio: monsterHPRatio)
    }
    func showMP(playerMP: Int, monsterMP: Int, playerMPRatio: Double, monsterMPRatio: Double) {
        playerMPLabel.text = "MP: \(String(playerMP))"
        monsterMPLabel.text = "MP: \(String(monsterMP))"
        
    }
    
    func showLose(lose: String) {
        gameLabel.text = lose
    }
    
    func showWin(win: String) {
        gameLabel.text = win
    }
    
// Notification
    @objc func playerAttackAnimate(notification: NSNotification) {
        //物理攻擊動畫
//        let imageView = UIImageView(frame: CGRect(x: 277 + monsterImageView.center.x , y: 29 + monsterImageView.center.y, width: 240, height: 128))
//        imageView.image = UIImage(named: "物理攻擊")
//        view.addSubview(imageView)
        playerAttackAnimateImageView.bounds.size = CGSize(width: 139, height: 210)
        //125 189
        playerAttackAnimateImageView.center = monsterImageView.center
            //CGRect(x: 277 + monsterImageView.center.x , y: 29 + monsterImageView.center.y, width: 112, height: 169)
        playerAttackAnimateImageView.image = UIImage(named: "物理攻擊")
        
        // 怪物被攻擊位移
        UIView.animate(withDuration: 0.2, animations: {
            self.monsterImageView.center.x += 10
        }) { (finish) in
            UIView.animate(withDuration: 0.2) {
                self.monsterImageView.center.x -= 10
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.playerAttackAnimateImageView.image = UIImage(named: "")
                }
            }
        }
        
        
    }
    
    @objc func monsterAttackAnimate(notification: NSNotification) {
        // 怪物被攻擊位移
        UIView.animate(withDuration: 0.2, animations: {
            self.playerImageView.center.x -= 10
        }) { (finish) in
            UIView.animate(withDuration: 0.2) {
                self.playerImageView.center.x += 10
            }
        }
    }
// Delegate & protocol
//    func playerAttackAnimate(atkType: String) {
//        // 怪物被攻擊位移
//        UIView.animate(withDuration: 0.2, animations: {
//            print(self.monsterImageView.center)
//            self.monsterImageView.center.x += 10
//        }) { (finish) in
//            UIView.animate(withDuration: 0.2) {
//                self.monsterImageView.center.x -= 10
//            }
//        }
//    }
//    func monsterAttackAnimate(atkType: String) {
//        // 玩家被攻擊位移
//        UIView.animate(withDuration: 0.2, animations: {
//            print(self.playerImageView.center)
//            self.playerImageView.center.x -= 10
//        }) { (finish) in
//            UIView.animate(withDuration: 0.2) {
//                self.playerImageView.center.x += 10
//            }
//        }
//    }
    
    var playerHPLayer: CAGradientLayer!
    var playerMPLayer: CAGradientLayer!
    var monsterHPLayer: CAGradientLayer!
    var monsterMPLayer: CAGradientLayer!
    
    func createPlayerHPLayer(ratio: Double) {
        if let playerHPLayer = playerHPLayer {
            playerHPLayer.removeFromSuperlayer()
        }
        playerHPLayer = CAGradientLayer()
        let zeroHPColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        let lowHPColor = UIColor(red: 255/255, green: 100/255, blue: 50/255, alpha: 1).cgColor
        let highHPColor = UIColor(red: 213/255, green: 189/255, blue: 121/255, alpha: 1).cgColor
        
        var secondColorLocation = 0.2 / ratio
        let thirdColorLocation = 1 * ratio
        let fourthColorLocation = 1 * ratio
        if secondColorLocation > thirdColorLocation {
            secondColorLocation = thirdColorLocation
        }

        playerHPLayer.frame = CGRect(x: 20, y: 121, width: 100, height: 5)
        playerHPLayer.startPoint = CGPoint(x:0.0, y:0.5)
        playerHPLayer.endPoint = CGPoint(x:1.0, y:0.5)
        playerHPLayer.locations = [0, NSNumber(value: secondColorLocation), NSNumber(value: thirdColorLocation), NSNumber(value: fourthColorLocation)]
        playerHPLayer.colors = [zeroHPColor, lowHPColor, highHPColor, UIColor.clear.cgColor]

        self.view.layer.addSublayer(playerHPLayer)
        
    }
    
    func createPlayerMPLayer(ratio: Double) {
        if let playerMPLayer = playerMPLayer {
            playerMPLayer.removeFromSuperlayer()
        }
        playerMPLayer = CAGradientLayer()
        
        var secondColorLocation = 0.2 * ratio
        let thirdColorLocation = 1 * ratio
        let fourthColorLocation = 1 * ratio
        if secondColorLocation > thirdColorLocation {
            secondColorLocation = thirdColorLocation
        }
        
        let zeroMPColor = UIColor(red: 60/255, green: 87/255, blue: 155/255, alpha: 1).cgColor
        let lowMPColor = UIColor(red: 85/255, green: 136/255, blue: 187/255, alpha: 1).cgColor
        let highMPColor = UIColor(red: 102/255, green: 153/255, blue: 221/255, alpha: 1).cgColor
        
        playerMPLayer.frame = CGRect(x: 20, y: 127, width: 100, height: 5)
        playerMPLayer.startPoint = CGPoint(x:0.0, y:0.5)
        playerMPLayer.endPoint = CGPoint(x:1.0, y:0.5)
        playerMPLayer.locations = [0, NSNumber(value: secondColorLocation), NSNumber(value: thirdColorLocation), NSNumber(value: fourthColorLocation)]
        playerMPLayer.colors = [zeroMPColor, lowMPColor, highMPColor, UIColor.clear.cgColor]
        
        self.view.layer.addSublayer(playerMPLayer)
    }
    
    func createMonsterHPLayer(ratio: Double) {

        if let monsterHPLayer = monsterHPLayer {
        monsterHPLayer.removeFromSuperlayer()
        }
        monsterHPLayer = CAGradientLayer()
        let zeroHPColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1).cgColor
        let lowHPColor = UIColor(red: 255/255, green: 100/255, blue: 50/255, alpha: 1).cgColor
        let highHPColor = UIColor(red: 213/255, green: 189/255, blue: 121/255, alpha: 1).cgColor
        
        var secondColorLocation = 0.2 / ratio
        let thirdColorLocation = 1.0 * ratio
        let fourthColorLocation = 1.0 * ratio
        if secondColorLocation > thirdColorLocation {
            secondColorLocation = thirdColorLocation
        }
        
        monsterHPLayer.frame = CGRect(x: 434, y: 41, width: 100, height: 5)
        monsterHPLayer.startPoint = CGPoint(x:0.0, y:0.5)
        monsterHPLayer.endPoint = CGPoint(x:1.0, y:0.5)
        monsterHPLayer.locations = [0, NSNumber(value: secondColorLocation), NSNumber(value: thirdColorLocation), NSNumber(value: fourthColorLocation)]
        monsterHPLayer.colors = [zeroHPColor, lowHPColor, highHPColor, UIColor.clear.cgColor]
        
        self.view.layer.addSublayer(monsterHPLayer)
        
    }
    
    func createMonsterMPLayer(ratio: Double) {
        monsterMPLayer = CAGradientLayer()
        if let monsterMPLayer = monsterMPLayer {
            monsterMPLayer.removeFromSuperlayer()
        }
        let zeroMPColor = UIColor(red: 60/255, green: 87/255, blue: 155/255, alpha: 1).cgColor
        let lowMPColor = UIColor(red: 85/255, green: 136/255, blue: 187/255, alpha: 1).cgColor
        let highMPColor = UIColor(red: 102/255, green: 153/255, blue: 221/255, alpha: 1).cgColor
        
        var secondColorLocation = 0.2 / ratio
        let thirdColorLocation = 1.0 * ratio
        let fourthColorLocation = 1.0 * ratio
        if secondColorLocation > thirdColorLocation {
            secondColorLocation = thirdColorLocation
        }
        
        monsterMPLayer.frame = CGRect(x: 434, y: 47, width: 100, height: 5)
        monsterMPLayer.startPoint = CGPoint(x:0.0, y:0.5)
        monsterMPLayer.endPoint = CGPoint(x:1.0, y:0.5)
        monsterMPLayer.locations = [0, NSNumber(value: secondColorLocation), NSNumber(value: thirdColorLocation), NSNumber(value: fourthColorLocation)]
        monsterMPLayer.colors = [zeroMPColor, lowMPColor, highMPColor, UIColor.clear.cgColor]
        
        self.view.layer.addSublayer(monsterMPLayer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameBoard.delegate = self
        gameBoard.setCharacter()
        
        createPlayerHPLayer(ratio: 1)
        createPlayerMPLayer(ratio: 1)
        createMonsterHPLayer(ratio: 1)
        createMonsterMPLayer(ratio: 1)
        NotificationCenter.default.addObserver(self, selector: #selector(playerAttackAnimate(notification:)), name: .playerAttackAnimate, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(monsterAttackAnimate(notification:)), name: .monsterAttackAnimate, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension Notification.Name {
    static let playerAttackAnimate = Notification.Name("plaeryAttackAnimate")
    static let monsterAttackAnimate = Notification.Name("monsterAttackAnimate")
}

