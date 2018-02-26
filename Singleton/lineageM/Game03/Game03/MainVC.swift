//
//  ViewController.swift
//  Game03
//
//  Created by 高菘駿 on 2018/2/26.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    @IBOutlet var ATKLabel: UILabel!
    @IBOutlet var DEFLabel: UILabel!
    @IBOutlet var HPLabel: UILabel!
    @IBOutlet var MPLabel: UILabel!
    @IBOutlet var moneyLabel: UILabel!
    
    @IBAction func earnMoneyButton(_ sender: Any) {
        Money.current.earnFiveMoney()
        moneyLabel.text = "$ \(Money.current.moneyNumber)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let player = Character(HP: 180, maxHP: 180, MP: 30, maxMP: 30, ATK: 10, DEF: 20)
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

