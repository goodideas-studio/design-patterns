//
//  FirstViewController.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var ghostImage: UIImageView!
    @IBOutlet weak var hpMpView: UIView!
    @IBOutlet weak var hpView: UIView!
    @IBOutlet weak var mpView: UIView!
    
    @IBOutlet weak var attackImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var monsterImage: UIImageView!
    @IBOutlet weak var heroImage: UIImageView!
    
    @IBOutlet weak var atkLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var mpLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var attackButton: UIButton!
    
    @IBAction func attackAction(_ sender: UIButton) {
        
        if heroImage.image == #imageLiteral(resourceName: "Hero-icon") {
            heroImage.image = #imageLiteral(resourceName: "Hero-icon-atk")
            attackImage.image = #imageLiteral(resourceName: "attack-1")
        } else {
            attackImage.image = #imageLiteral(resourceName: "attack-2")
            heroImage.image = #imageLiteral(resourceName: "Hero-icon")
        }
        
        UIView.animate(withDuration: 0.4, animations: {
            self.attackImage.alpha = 0.8
        }, completion: { (finish) in
            UIView.animate(withDuration: 0.8, animations: {
                self.attackImage.alpha = 0
            }, completion: { (finish) in
                
            })
        })
        
        Character.shared.hp -= 10
        
        updateStatus()
        updateHPMP()
        Character.shared.dollars += 100
        moneyLabel.text = String(Character.shared.dollars)
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        attackImage.alpha = 0
        
        // load其他View
        if let viewControllers = tabBarController?.viewControllers {
            for viewController in viewControllers {
                let _ = viewController.view
            }
        }
        
//        tabBarController?.viewControllers?.forEach { $0.view }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateHPMP()
        updateStatus()
        ghostImage.center.y += 30
        ghostImage.alpha = 0
        
        
        UIView.animate(withDuration: 0.8, delay: 0, options: [UIViewAnimationOptions.autoreverse,.repeat], animations: {
            self.monsterImage.center.y -= 50
        }) { (finish) in
            self.monsterImage.center.y += 50
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateHPMP() {
        
        if Character.shared.hp <= 0 {
            self.hpView.frame = CGRect(x: 0, y: 0, width: 0, height: 10)
            UIView.animate(withDuration: 1, animations: {
                UIView.animate(withDuration: 1, animations: {
                    self.ghostImage.alpha = 1
                    self.ghostImage.center.y -= 30
                })
            }, completion: { (finish) in
                UIView.animate(withDuration: 1, animations: {
                    self.ghostImage.alpha = 0
                })
            })
            
            
            self.attackButton.isEnabled = false
        } else {
            self.attackButton.isEnabled = true
            self.hpView.frame = CGRect(x: 0, y: 0, width: Character.shared.hp, height: 10)
        }
        
        
    }
    
    func updateStatus() {
        atkLabel.text = "ATK:\(Character.shared.atk)"
        defLabel.text = "DEF:\(Character.shared.def)"
        hpLabel.text = "HP:\(Character.shared.hp)"
        mpLabel.text = "MP:\(Character.shared.mp)"
        moneyLabel.text = "\(Character.shared.dollars)"
    }


}

