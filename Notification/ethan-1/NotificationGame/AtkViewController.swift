//
//  AtkViewController.swift
//  NotificationGame
//
//  Created by EthanLin on 2018/2/12.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit


protocol AtkGameOverDelegate {
    func atkGameOver(playerHP:Int, bossHP:Int)
}

class AtkViewController: UIViewController {
    
  
    var isPlaying:Bool?
    
    var timerAtk:Timer?
    
    var delegate:AtkGameOverDelegate?
    
    var atkPlayer = Player(HP: 100)
    var atkBoss = Boss(HP: 100)
    
    @IBOutlet weak var atkGamePlayerHP: UILabel!
    @IBOutlet weak var atkGameBossHP: UILabel!
    
    @IBOutlet weak var atkPlayerImageView: UIImageView!
    @IBOutlet weak var atkBossImageView: UIImageView!
    
    
    
    //
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        atkPlayerImageView.image = UIImage(named: "Player1Atk")
//        atkBossImageView.image = UIImage(named: "Player2Atk")
//
//        NotificationCenter.default.addObserver(self, selector: #selector(changeAtkGamePlayerLabel), name: NSNotification.Name(rawValue: startGameKey), object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(changeAtkGameBossLabel), name: NSNotification.Name(rawValue: startGameKey), object: nil)
//
//        NotificationCenter.default.addObserver(self, selector: #selector(resetAtkGameCharacterLabel), name: NSNotification.Name(rawValue: resetGameKey), object: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        atkPlayerImageView.image = UIImage(named: "Player1Atk")
        atkBossImageView.image = UIImage(named: "Player2Atk")
        isPlaying = false

        NotificationCenter.default.addObserver(self, selector: #selector(changeAtkGameCharacterLabel), name: NSNotification.Name(rawValue: startGameKey), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(resetAtkGameCharacterLabel), name: NSNotification.Name(rawValue: resetGameKey), object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func changeAtkGameCharacterLabel(){
        if isPlaying == false{
            self.timerAtk = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeCharacterHP), userInfo: nil, repeats: true)
        }
        
    }
    
    
    @objc func changeCharacterHP(){
        isPlaying = true
        
        
        
        delegate?.atkGameOver(playerHP: atkPlayer.HP!, bossHP: atkBoss.HP!)
        atkGameBossHP.text = "HP: \(atkBoss.HP!)"
        atkGamePlayerHP.text = "HP: \(atkPlayer.HP!)"
        
        if atkPlayer.HP! > 0 && atkBoss.HP! == 0{
            self.timerAtk?.invalidate()
            self.timerAtk = nil
            let alert = UIAlertController(title: "遊戲1Boss輸了", message: "Boss生命值歸0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重新開始遊戲1", style: .default, handler: { (action) in
                self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true, completion: nil)
            
        }
        
        
        
        let imageOriginBoss = self.atkBossImageView.center.x
        let optsBoss = UIViewAnimationOptions.autoreverse
        UIView.animate(withDuration: 0.1, delay: 0, options: optsBoss, animations: {
            self.atkBossImageView.center.x -= 5
        }) { _ in
            self.atkBossImageView.center.x = imageOriginBoss
        }
        

        if atkPlayer.HP! == 0 && atkBoss.HP! > 0{
            
            self.timerAtk?.invalidate()
            self.timerAtk = nil

            let alert = UIAlertController(title: "遊戲1玩家輸了", message: "玩家生命值歸0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重新開始遊戲1", style: .default, handler: { (action) in
                self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true, completion: nil)
            
        }
        
        
        //圖片動畫（來回）
        let imageOriginPlayer = self.atkPlayerImageView.center.x
        let optsPlayer = UIViewAnimationOptions.autoreverse
        UIView.animate(withDuration: 0.1, delay: 0, options: optsPlayer, animations: {
            self.atkPlayerImageView.center.x += 5
        }) { _ in
            self.atkPlayerImageView.center.x = imageOriginPlayer
        }
        
        atkBoss.HP! -= 10
        atkPlayer.HP! -= 5
        
        
    }
    
    @objc func resetAtkGameCharacterLabel(){
        
        isPlaying = false
        self.timerAtk?.invalidate()
        self.timerAtk = nil

        atkPlayer.HP! = 100
        atkBoss.HP! = 100
        atkGamePlayerHP.text = "HP: \(atkPlayer.HP!)"
        atkGameBossHP.text = "HP: \(atkBoss.HP!)"
        delegate?.atkGameOver(playerHP: atkPlayer.HP!, bossHP: atkBoss.HP!)
        
    }
    
    
}





