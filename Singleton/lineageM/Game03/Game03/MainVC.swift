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
    @IBOutlet weak var damageLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    
    @IBAction func earnMoneyButton(_ sender: Any) {
        Money.current.earnFiveMoney()
        let damage = Double(arc4random_uniform(10 - UInt32(player.DEF / 5))) * (30 / Double(player.ATK))
        player.HP = max(player.HP - Int(damage), 0)
        view.addSubview(damageLabel)
        
        damageLabel.frame.origin = CGPoint(x: 157, y: 168)
        print(damage)
        damageLabel.text = "- \(Int(damage))"
        
        UIView.animate(withDuration: 0.5, animations: {
            self.damageLabel.frame.origin = CGPoint(x: 157, y: 78)
            self.damageLabel.alpha = 0.7
        }){ _ in
           
            self.damageLabel.frame.origin = CGPoint(x: 157, y: 168)
            self.damageLabel.alpha = 1
            self.damageLabel.text = ""
        }
        
        if player.HP > 0 {
        
        UIView.animate(withDuration: 0.1, animations: {
            self.characterImageView.center.x += 5
            //self.characterImageView.center.y += 5
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.characterImageView.center.x -= 5
                //self.characterImageView.center.y -= 5
                //self.characterImageView.alpha = 0.9
            }, completion: { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.characterImageView.center.x += 10
                    //self.characterImageView.center.y += 5
                    //self.characterImageView.alpha = 1
                }, completion: { _ in
                    UIView.animate(withDuration: 0.1, animations: {
                        self.characterImageView.center.x -= 5
                        //self.characterImageView.center.y -= 0
                        
                    })
                })
            })
        }
        } else {
            let alert = UIAlertController(title: "你死掉了！！", message: "重新開始?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.player = Character(HP: 180, maxHP: 180, MP: 30, maxMP: 30, ATK: 10, DEF: 20)
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
        
        createPlayerHPLayer(ratio: Double(player.HP)/Double(player.maxHP))
        HPLabel.text = "HP: \(player.HP)"
        moneyLabel.text = "$: \(Money.current.moneyNumber)"
    }
    
    var playerHPLayer: CAGradientLayer!
    var playerMPLayer: CAGradientLayer!
    
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
    
    var player = Character(HP: 180, maxHP: 180, MP: 30, maxMP: 30, ATK: 10, DEF: 20)
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

