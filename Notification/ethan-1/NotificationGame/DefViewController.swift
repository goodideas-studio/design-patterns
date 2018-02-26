//
//  DefViewController.swift
//  NotificationGame
//
//  Created by EthanLin on 2018/2/12.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

protocol DefGameOverDelegate {
    func defGameOver(playerHP:Int, bossHP:Int)
}

class DefViewController: UIViewController {
    
    var isPlaying:Bool?
    
    var timerDef:Timer?

    
    @IBOutlet weak var defGamePlayerHP: UILabel!
    @IBOutlet weak var defGameBossHP: UILabel!
    @IBOutlet weak var defPlayerImageView: UIImageView!
    @IBOutlet weak var defBossImageView: UIImageView!
    
    
    var delegate:DefGameOverDelegate?
    var defPlayer = Player(HP: 100)
    var defBoss = Boss(HP: 100)
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defPlayerImageView.image = UIImage(named: "Player1Def")
        defBossImageView.image = UIImage(named: "Player2Atk")
        isPlaying = false
            NotificationCenter.default.addObserver(self, selector: #selector(changeDefCharacterLabel), name: NSNotification.Name(rawValue: startGameKey), object: nil)


        NotificationCenter.default.addObserver(self, selector: #selector(resetDefCharacterLabel), name: NSNotification.Name(rawValue: resetGameKey), object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeDefCharacterLabel(){
        if isPlaying == false{
          timerDef = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(changeCharacterHP), userInfo: nil, repeats: true)
        }
        
    }
    
    @objc func changeCharacterHP(){
        isPlaying = true
        //血量
        delegate?.defGameOver(playerHP: defPlayer.HP!, bossHP: defBoss.HP!)
        defGamePlayerHP.text = "HP: \(String(describing: defPlayer.HP!))"
        defGameBossHP.text = "HP: \(String(describing: defBoss.HP!))"
        
        if defPlayer.HP! == 0 && defBoss.HP! > 0{
            self.timerDef?.invalidate()
            self.timerDef = nil
           
            let alert = UIAlertController(title: "遊戲2玩家輸了", message: "玩家生命值歸0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重新開始遊戲2", style: .default, handler: { (action) in
                self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true, completion: nil)
            
        }
        
        
        
        //圖片動畫(來回)
        let imageOrigin = self.defPlayerImageView.center.x
        let opts = UIViewAnimationOptions.autoreverse
        UIView.animate(withDuration: 0.1, delay: 0, options: opts, animations: {
            self.defPlayerImageView.center.x -= 5
        }) { _ in
            self.defPlayerImageView.center.x = imageOrigin
        }
        
        if defPlayer.HP! > 0 && defBoss.HP! == 0{
            self.timerDef?.invalidate()
            self.timerDef = nil
            
            let alert = UIAlertController(title: "遊戲2Boss輸了", message: "Boss生命值歸0", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "重新開始遊戲2", style: .default, handler: { (action) in
                self.tabBarController?.selectedIndex = 0
            }))
            present(alert, animated: true, completion: nil)
            
        }
        //血量
        
        
        //圖片動畫（來回）
        let imageOriginBoss = self.defBossImageView.center.x
        let optsBoss = UIViewAnimationOptions.autoreverse
        UIView.animate(withDuration: 0.1, delay: 0, options: optsBoss, animations: {
            self.defBossImageView.center.x -= 5
        }) { _ in
            self.defBossImageView.center.x = imageOriginBoss
        }
        
        defPlayer.HP = defPlayer.HP! - 10
        defBoss.HP = defBoss.HP! - 2
    }



    
    @objc func resetDefCharacterLabel(){
        isPlaying = false
        
        self.timerDef?.invalidate()
        self.timerDef = nil
        defPlayer.HP! = 100
        defBoss.HP! = 100
        defGamePlayerHP.text = "HP: \(defPlayer.HP!)"
        defGameBossHP.text = "HP: \(defBoss.HP!)"
        delegate?.defGameOver(playerHP: defPlayer.HP!, bossHP: defBoss.HP!)
        
    }
    
   

}
