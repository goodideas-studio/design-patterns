//
//  MagicViewController.swift
//  NotificationGame
//
//  Created by EthanLin on 2018/2/12.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

protocol MagicGameOverDelegate {
    func magicGameOver(playerHP:Int, bossHP:Int)
}

class MagicViewController: UIViewController {
    
    var isPlaying:Bool?
    
    @IBOutlet weak var magicGamePlayerHP: UILabel!
    @IBOutlet weak var magicGameBossHP: UILabel!
    @IBOutlet weak var magicPlayerImageView: UIImageView!
    @IBOutlet weak var magicBossImageView: UIImageView!
    
    
    
    var delegate:MagicGameOverDelegate?
    var magicPlayer = Player(HP: 100)
    var magicBoss = Boss(HP: 100)
    
    
    var timerMagic: Timer?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isPlaying = false
        magicPlayerImageView.image = UIImage(named: "Player1Cun")
        magicBossImageView.image = UIImage(named: "Player2Atk")
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.changeMagicCharacterLabel), name: NSNotification.Name(rawValue: startGameKey), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.resetMagicPlayerLabel), name: NSNotification.Name(rawValue: resetGameKey), object: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @objc func changeMagicCharacterLabel(){
        if isPlaying == false{
           timerMagic = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(changeCharacterHP), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func changeCharacterHP(){
        isPlaying = true
        
        delegate?.magicGameOver(playerHP: magicPlayer.HP!, bossHP: magicBoss.HP!)
        magicGamePlayerHP.text = "HP: \(String(describing: magicPlayer.HP!))"
        magicGameBossHP.text = "HP: \(String(describing: magicBoss.HP!))"
        
        if magicPlayer.HP! == 0 && magicBoss.HP! > 0{
            self.timerMagic?.invalidate()
            self.timerMagic = nil
            let alert = UIAlertController(title: "遊戲3玩家輸了", message: "玩家生命值歸0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重新開始遊戲3", style: .default, handler: { (action) in
                self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true, completion: nil)
            
        }
        
        
        
        
        //圖片動畫（來回）
        let imageOrigin = self.magicPlayerImageView.center.x
        let opts = UIViewAnimationOptions.autoreverse
        UIView.animate(withDuration: 0.1, delay: 0, options: opts, animations: {
            self.magicPlayerImageView.center.x += 5
        }) { _ in
            self.magicPlayerImageView.center.x = imageOrigin
        }
        
        if magicPlayer.HP! > 0 && magicBoss.HP! == 0{
            self.timerMagic?.invalidate()
            self.timerMagic = nil
            let alert = UIAlertController(title: "遊戲3Boss輸了", message: "Boss生命值歸0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重新開始遊戲3", style: .default, handler: { (action) in
                self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true, completion: nil)
            
        }
        
        
        
        
        let imageOriginBoss = self.magicBossImageView.center.x
        let optsBoss = UIViewAnimationOptions.autoreverse
        UIView.animate(withDuration: 0.1, delay: 0, options: optsBoss, animations: {
            self.magicBossImageView.center.x += 5
        }) { _ in
            self.magicBossImageView.center.x = imageOriginBoss
        }
        
        magicPlayer.HP = magicPlayer.HP! - 10
        magicBoss.HP = magicBoss.HP! - 20
        
    }
    

    
    @objc func resetMagicPlayerLabel(){
        isPlaying = false
        
        self.timerMagic?.invalidate()
        self.timerMagic = nil
        
        magicPlayer.HP! = 100
        magicBoss.HP! = 100
        magicGamePlayerHP.text = "HP: \(magicPlayer.HP!)"
        magicGameBossHP.text = "HP: \(magicBoss.HP!)"
        delegate?.magicGameOver(playerHP: magicPlayer.HP!, bossHP: magicBoss.HP!)
        
    }
    
    
    
}
