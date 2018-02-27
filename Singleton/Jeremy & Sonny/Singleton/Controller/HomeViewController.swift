//
//  FirstViewController.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    
    @IBOutlet weak var atkLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var mpLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBAction func attackAction(_ sender: UIButton) {
        print("atk")
        Character.shared.dollars += 100
        moneyLabel.text = String(Character.shared.dollars)
        
        // tabBar 傳值到 shopView
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 載入角色素質
        atkLabel.text = "ATK:\(Character.shared.atk)"
        defLabel.text = "DEF:\(Character.shared.def)"
        hpLabel.text = "HP:\(Character.shared.hp)"
        mpLabel.text = "MP:\(Character.shared.mp)"
        moneyLabel.text = "\(Character.shared.dollars)"
        
        
        
        
        if let viewControllers = tabBarController?.viewControllers {
            for viewController in viewControllers {
                let _ = viewController.view
            }
        }
        
//        tabBarController?.viewControllers?.forEach { $0.view }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        atkLabel.text = "ATK:\(Character.shared.atk)"
        defLabel.text = "DEF:\(Character.shared.def)"
        hpLabel.text = "HP:\(Character.shared.hp)"
        mpLabel.text = "MP:\(Character.shared.mp)"
        moneyLabel.text = "\(Character.shared.dollars)"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

