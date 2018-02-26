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
    
    @IBAction func earnMoneyButton(_ sender: Any) {
        Money.current.earnFiveMoney()
        player.HP -= 5
        HPLabel.text = "HP: \(player.HP)"
        moneyLabel.text = "$: \(Money.current.moneyNumber)"
    }
    
    let player = Character(HP: 180, maxHP: 180, MP: 30, maxMP: 30, ATK: 10, DEF: 20)
    
    func useItem(itemName: String) {
        switch itemName {
        case "red_potion":
            player.HP = min(player.maxHP, player.HP + 10)
            HPLabel.text = "HP: \(player.HP)"
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
        let backpackVC = tabBarController?.viewControllers![1] as! PacketVC
        backpackVC.delegate = self
        
        ATKLabel.text = "ATK: \(player.ATK)"
        DEFLabel.text = "DEF: \(player.DEF)"
        HPLabel.text = "HP: \(player.HP)"
        MPLabel.text = "MP: \(player.MP)"
        moneyLabel.text = "$: \(Money.current.moneyNumber)"
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

