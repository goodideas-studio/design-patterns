//
//  ViewController.swift
//  Game03
//
//  Created by 高菘駿 on 2018/2/26.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class MainVC: UIViewController, useItemDelegate {
    
    @IBOutlet var ATKLabel: UILabel!
    @IBOutlet var DEFLabel: UILabel!
    @IBOutlet var HPLabel: UILabel!
    @IBOutlet var MPLabel: UILabel!
    @IBOutlet var moneyLabel: UILabel!
    @IBOutlet var damageLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    
// fight 場景
    @IBOutlet var background1: UIImageView!
    @IBOutlet var background2: UIImageView!
    var playerImageView: UIImageView?
    
    @IBAction func earnMoneyButton(_ sender: Any) {

        creatMonster(monsterName: "skull")

    }
    
    @IBAction func ghostButton(_ sender: Any) {
        
        creatMonster(monsterName: "ghost")
        
    }
    
    @IBAction func vampireButton(_ sender: Any) {

        creatMonster(monsterName: "vampire")
    }
    
    @IBAction func fightButton(_ sender: Any) {
        if monsters.count == 0 {
            
            let alert = UIAlertController(title: "請先選擇怪物", message: "一次可以挑戰最多五隻怪物", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "好", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            fight()
        }
    }
    
    func creatMonster(monsterName: String){
        
        let imageView = UIImageView(frame: CGRect(x: 380, y: 430 , width: 64, height: 64))
        
        let skullGifPhoto = UIImage.animatedImageNamed("骷髏左走", duration: 0.8)
        let ghostGifPhoto = UIImage.animatedImageNamed("鬼魂左走", duration: 0.8)
        let vampireGifPhoto = UIImage.animatedImageNamed("吸血鬼左走", duration: 0.8)
        
        var monster = Character()
        let skull = Character(name: "骷髏", HP: 30, maxHP: 30, MP: 5, maxMP: 5, ATK: 5, DEF: 5, reward: 1)
        let ghost = Character(name: "鬼魂", HP: 50, maxHP: 50, MP: 10, maxMP: 10, ATK: 5, DEF: 20, reward: 5)
        let vampire = Character(name: "吸血鬼", HP: 100, maxHP: 100, MP: 40, maxMP: 40, ATK: 15, DEF: 15, reward: 20)

        switch monsterName {
        case "skull":
            imageView.image = skullGifPhoto
            monster = skull
            
        case "ghost":
            imageView.image = ghostGifPhoto
            monster = ghost
            
        case "vampire":
            imageView.image = vampireGifPhoto
            monster = vampire
        default: print("wrong monsterName")
        }
        
        if monsters.count < 5 {
            monsterImageViews.append(imageView)
            monsters.append(monster)
        } else {
            let alert = UIAlertController(title: "太多隻怪了", message: "直接開戰", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "取消", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "好", style: .default, handler: { _ in
                self.fight()
            }))
            present(alert, animated: true)
        }
        
        //fight()
        
    }
//＝＝＝＝變數宣告＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    var player: Character!
    var monsters: [Character] = []

    var monsterImageViews: [UIImageView?] = []
    
    var playerHPLayer: CAGradientLayer!
    var playerMPLayer: CAGradientLayer!
    
    var playerWalkTimer: Timer?
    var monsterWalkTimer: Timer?
    
    var isFight: Bool = false
    
    let knight = Character(name: "騎士右走", HP: 180, maxHP: 180, MP: 30, maxMP: 30, ATK: 10, DEF: 15, reward: 0)

    
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
        playerHPLayer.frame = CGRect(x: 327, y: 71, width: 80, height: 5)
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
        
        var secondColorLocation = 0.2 / ratio
        let thirdColorLocation = 1 * ratio
        let fourthColorLocation = 1 * ratio
        if secondColorLocation > thirdColorLocation {
            secondColorLocation = thirdColorLocation
        }
        
        let zeroMPColor = UIColor(red: 60/255, green: 87/255, blue: 155/255, alpha: 1).cgColor
        let lowMPColor = UIColor(red: 85/255, green: 136/255, blue: 187/255, alpha: 1).cgColor
        let highMPColor = UIColor(red: 102/255, green: 153/255, blue: 221/255, alpha: 1).cgColor
        
        playerMPLayer.frame = CGRect(x: 327, y: 101, width: 80, height: 5)
        playerMPLayer.startPoint = CGPoint(x:0.0, y:0.5)
        playerMPLayer.endPoint = CGPoint(x:1.0, y:0.5)
        playerMPLayer.locations = [0, NSNumber(value: secondColorLocation), NSNumber(value: thirdColorLocation), NSNumber(value: fourthColorLocation)]
        playerMPLayer.colors = [zeroMPColor, lowMPColor, highMPColor, UIColor.clear.cgColor]
        
        self.view.layer.addSublayer(playerMPLayer)
    }

    func useItem(itemName: String) {
        
        switch itemName {
        case "red_potion":
            player.HP = min(player.maxHP, player.HP + 10)
            HPLabel.text = "HP: \(player.HP)"
            createPlayerHPLayer(ratio: Double(player.HP)/Double(player.maxHP))
        case "orange_potion":
            player.HP = min(player.maxHP, player.HP + 20)
            HPLabel.text = "HP \(player.HP)"
            
        case "clear_potion":
            player.HP = min(player.maxHP, player.HP + 30)
            HPLabel.text = "HP \(player.HP)"
        case "ancient_red_potion":
            player.HP = min(player.maxHP, player.HP + 15)
            HPLabel.text = "HP \(player.HP)"
        case "ancient_orange_potion":
            player.HP = min(player.maxHP, player.HP + 30)
            HPLabel.text = "HP \(player.HP)"
        case "ancient_clear_potion":
            player.HP = min(player.maxHP, player.HP + 45)
            HPLabel.text = "HP \(player.HP)"
        case "atk_potion":
            player.ATK += 5
            ATKLabel.text = "ATK: \(player.ATK)"
        case "def_potion":
            player.DEF += 5
            DEFLabel.text = "DEF: \(player.DEF)"
        default:
            break
        }
    }
    
    func fight() {
       
        if isFight == false {
            background1.image = UIImage(named: "background001")
            background2.image = UIImage(named: "background002")
            view.addSubview(background1)
            view.addSubview(background2)
            
            if monsterImageViews.count > 0 {
                
                let monsterData: NSMutableDictionary
                
                for i in 0..<monsterImageViews.count {
                    
                    monsterImageViews[i]?.frame.origin.x -= CGFloat(32 * (monsterImageViews.count - i))
                    
                    view.addSubview(monsterImageViews[i]!)
                }
                monsterData = ["imageViews": monsterImageViews, "distance": -10]
                monsterWalkWithTImer(timerInfo: monsterData)
                
            }
            
            if playerImageView == nil {
                
                playerImageView = UIImageView(frame: CGRect(x: 20, y: 430, width: 64, height: 64))
                playerImageView!.image = UIImage.animatedImageNamed("騎士右走", duration: 0.8)
                
                view.addSubview(playerImageView!)
                
                let playerData: NSMutableDictionary = ["imageView": playerImageView!, "distance": 10]
                playerWalkWithTimer(timerInfo: playerData)
            }
            
            isFight = true
        }
    }
    
    @objc func playerWalkWithTimer(timerInfo: NSMutableDictionary) {
        guard playerWalkTimer == nil else { return }
        playerWalkTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(playerWalk), userInfo: timerInfo, repeats: true)
    }
    
    @objc func monsterWalkWithTImer(timerInfo: NSMutableDictionary) {
        guard monsterWalkTimer == nil else { return}
        monsterWalkTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(monsterWalk), userInfo: timerInfo, repeats: true)
    }
    
//＝＝＝＝走路相關＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
//＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝
    
    @objc func playerWalk(timer: Timer) {
        
        let data = timer.userInfo! as! NSMutableDictionary
        let imageView = data["imageView"] as! UIImageView
        let distance = data["distance"] as! CGFloat
        
            UIView.animate(withDuration: 0.5, animations: {
                imageView.center.x += distance
                self.touchTogether()
            })
        
    }
    
    @objc func monsterWalk(timer: Timer) {
        
        let data = timer.userInfo! as! NSMutableDictionary
        let imageViews = data["imageViews"] as! [UIImageView]
        let distance = data["distance"] as! CGFloat
        
        for imageView in imageViews {
            UIView.animate(withDuration: 0.2, animations: {
                imageView.center.x += distance
                //self.touchTogether()
            })
        }
    }
    
    func touchTogether() {
        guard playerImageView != nil else { return }
        
        let playerLocation = playerImageView!.frame.origin.x + playerImageView!.frame.width
        let monsterLocation: CGFloat?
        
        if let firstMonster = monsterImageViews.min(by: { $0!.frame.origin.x < $1!.frame.origin.x}) {
        
            monsterLocation = firstMonster?.frame.origin.x
            let index = monsterImageViews.index(where: { (imageView) -> Bool in
                if imageView === firstMonster { return true } else {return false}
            })
            
            let monsterLossHPLabel = UILabel(frame: CGRect(x: firstMonster!.center.x + 10, y: firstMonster!.frame.origin.y - 25, width: 64, height: 20))
            monsterLossHPLabel.textColor = .red
            monsterLossHPLabel.font = monsterLossHPLabel.font.withSize(30)
            
            let playerLossHPLabel = UILabel(frame: CGRect(x: 291, y: 51, width: 40, height: 20))
            playerLossHPLabel.textColor = .red
            playerLossHPLabel.font = playerLossHPLabel.font.withSize(20)
    
            if playerLocation >= monsterLocation! + 25 {
                
                var playerDamage = player.ATK - 3 + Int(arc4random_uniform(4)) - monsters[index!].DEF / 5
                var monsterDamage = monsters[index!].ATK - 3 + Int(arc4random_uniform(4))  - player.DEF / 5
                
                //爆擊計算
                if Int(arc4random_uniform(100)) / 10 <= 1 {
//                    print("                                      玩家爆擊！！！！")
                    playerDamage  *= 2
                }
                if Int(arc4random_uniform(100)) / 10 <= 1 {
//                    print("                                      怪物爆擊！！！！")
                    monsterDamage  *= 2
                }
                
                if playerDamage > monsterDamage {
                    UIView.animate(withDuration: 0.5, animations: {
                        
                        firstMonster?.frame.origin.x = min( (playerLocation + CGFloat(playerDamage)) + 20, (self.view.frame.width - 32))
                        monsterLossHPLabel.frame.origin.x = min( (playerLocation + CGFloat(playerDamage)) + 20, (self.view.frame.width - 32))
                        monsterLossHPLabel.textColor = UIColor.red
                        monsterLossHPLabel.font = monsterLossHPLabel.font.withSize(30)
                        
    //self.dollMonsterHPLayer.frame.origin.x += 2 * CGFloat(self.player.ATK)
    //self.dollMonsterMPLayer.frame.origin.y += 2 * CGFloat(self.player.ATK)
                    })
                    playerImageView?.frame.origin.x = max( (monsterLocation! - playerImageView!.frame.width + 10), -32)
                } else {
                    UIView.animate(withDuration: 0.5, animations: {
                        self.playerImageView?.frame.origin.x = max( (monsterLocation! - (self.playerImageView?.frame.width)! - CGFloat(monsterDamage) - 20), -32)
                        
                        monsterLossHPLabel.frame.origin.x = firstMonster!.frame.origin.x + 10
                    })
                }
                
                player.HP = max(player.HP - max(monsterDamage, 0) , 0)
                playerLossHPLabel.text = "- \(max(monsterDamage,0))"
                createPlayerHPLayer(ratio: Double(player.HP) / Double(player.maxHP))
                HPLabel.text = "HP: \(player.HP)"
                monsters[index!].HP = max( monsters[index!].HP - max(playerDamage, 0), 0)
                monsterLossHPLabel.text = "- \(max(playerDamage,0))"
              
                view.addSubview(monsterLossHPLabel)
                view.addSubview(playerLossHPLabel)
                
                UIView.animate(withDuration: 1, animations: {
                    monsterLossHPLabel.frame.origin.y -= 20
                }, completion: { _ in
                    UIView.animate(withDuration: 1, animations: {
                        monsterLossHPLabel.alpha = 0.6
                        monsterLossHPLabel.removeFromSuperview()
                        playerLossHPLabel.removeFromSuperview()
                    })
                })
            
                if monsters[index!].HP <= 0 {
                    Money.current.moneyNumber += monsters[index!].reward
                    moneyLabel.text = "$: \(Money.current.moneyNumber)"
                    
                    let getMoneyLabel = UILabel(frame: CGRect(x: monsterImageViews[index!]!.center.x, y: monsterImageViews[index!]!.center.y, width: 100, height: 40))
                    getMoneyLabel.textColor = .yellow
                    
                    getMoneyLabel.text = "+ \(monsters[index!].reward)"
                    view.addSubview(getMoneyLabel)
                    
                    UIView.animate(withDuration: 5, animations: {
                        getMoneyLabel.frame.origin = CGPoint(x: self.moneyLabel.center.x + 20, y: self.moneyLabel.center.y)
                        getMoneyLabel.font = getMoneyLabel.font.withSize(30)
                    })
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
                        getMoneyLabel.removeFromSuperview()
                    })
                    
                    monsterImageViews[index!]?.removeFromSuperview()
                    monsterImageViews.remove(at: index!)
                    monsters.remove(at: index!)
                }
                if player.HP == 0 {
                    dollFightOver()
                    let alert = UIAlertController(title: "你死掉了！！", message: "重新開始?", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                        self.player = Character(name: "騎士右走", HP: 180, maxHP: 180, MP: 30, maxMP: 30, ATK: 10, DEF: 15, reward: 0)
                        self.createPlayerHPLayer(ratio: 1)
                        self.createPlayerMPLayer(ratio: 1)
                        self.ATKLabel.text = "ATK: \(self.player.ATK)"
                        self.DEFLabel.text = "DEF: \(self.player.DEF)"
                        self.HPLabel.text = "HP: \(self.player.HP)"
                        self.MPLabel.text = "MP: \(self.player.MP)"
                        Money.current.moneyNumber = 0
                        Backpack.current.backpackItems = []
                        self.moneyLabel.text = "$: \(Money.current.moneyNumber)"
                    }))
                    present(alert, animated: true)
                }
            } //ending: playerLocation >= monsterLocation! + 25
        
        } else if (playerImageView?.frame.origin.x)! + (playerImageView?.frame.width)! >= self.view.frame.width || monsters.count == 0 {
            dollFightOver()
        }
    }
    
    func dollFightOver() {
//        print("win!!")
        background1.removeFromSuperview()
        background2.removeFromSuperview()
        for imageView in monsterImageViews {
            imageView?.removeFromSuperview()
        }
        
        playerImageView?.removeFromSuperview()
        playerImageView = nil
        monsterImageViews = []
        monsters = []
        
        isFight = false
        
        playerWalkTimer?.invalidate()
        playerWalkTimer = nil
        monsterWalkTimer?.invalidate()
        monsterWalkTimer = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = knight
        createPlayerHPLayer(ratio: 1)
        createPlayerMPLayer(ratio: 1)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        let backpackVC = tabBarController?.viewControllers![1] as! PacketVC
        backpackVC.delegate = self
        createPlayerHPLayer(ratio: Double(player.HP) / Double(player.maxHP))
        createPlayerMPLayer(ratio: Double(player.MP) / Double(player.maxMP))
        ATKLabel.text = "ATK: \(player.ATK)"
        DEFLabel.text = "DEF: \(player.DEF)"
        HPLabel.text = "HP: \(player.HP)"
        MPLabel.text = "MP: \(player.MP)"
        moneyLabel.text = "$: \(Money.current.moneyNumber)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

