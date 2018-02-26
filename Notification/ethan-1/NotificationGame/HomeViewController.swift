//
//  HomeViewController.swift
//  NotificationGame
//
//  Created by EthanLin on 2018/2/12.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit


let startGameKey = "com.ethan510010.startGame"


let resetGameKey = "com.ethan510010.resetGame"



class HomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var atkGameLabel: UILabel!
    @IBOutlet weak var defGameLabel: UILabel!
    @IBOutlet weak var magicGameLabel: UILabel!
    
    
    @IBAction func startGame(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: startGameKey), object: nil)

    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: resetGameKey), object: nil)
        
    }
    
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//
//        for viewController in (self.tabBarController?.viewControllers)!{
//            _ = viewController.view
//        }
//
//        let atkViewController = tabBarController?.viewControllers![1] as! AtkViewController
//
//        atkViewController.delegate = self
//
//        let defViewController = tabBarController?.viewControllers![2] as! DefViewController
//
//        defViewController.delegate = self
//
//        let magicViewController = tabBarController?.viewControllers![3] as! MagicViewController
//        
//        magicViewController.delegate = self
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for viewController in (self.tabBarController?.viewControllers)!{
            _ = viewController.view
        }
        
        let atkViewController = tabBarController?.viewControllers![1] as! AtkViewController

        atkViewController.delegate = self

        let defViewController = tabBarController?.viewControllers![2] as! DefViewController

        defViewController.delegate = self

        let magicViewController = tabBarController?.viewControllers![3] as! MagicViewController

        magicViewController.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension HomeViewController: AtkGameOverDelegate{
    func atkGameOver(playerHP: Int, bossHP: Int) {
        print(playerHP, bossHP)
//        if playerHP == 100 && bossHP == 100 {
                self.atkGameLabel.text = "AtkGame - HP: \(playerHP) VS HP: \(bossHP) "
//        }
        
        if playerHP == 0 || bossHP == 0{
                self.atkGameLabel.text = "遊戲1結束"
            }

        
    }
}

extension HomeViewController: DefGameOverDelegate{
    func defGameOver(playerHP: Int, bossHP: Int) {
        if playerHP == 0 || bossHP == 0{
            defGameLabel.text = "遊戲2結束"
            
        }else{
            defGameLabel.text = "DefGame - HP: \(playerHP) VS HP: \(bossHP)"
        }
    }
}


extension HomeViewController: MagicGameOverDelegate{
    func magicGameOver(playerHP: Int, bossHP: Int) {
        if playerHP == 0 || bossHP == 0{
            magicGameLabel.text = "遊戲3結束"
            
        }else{
            magicGameLabel.text = "MagicGame - HP: \(playerHP) VS HP: \(bossHP)"
        }
    }
}
