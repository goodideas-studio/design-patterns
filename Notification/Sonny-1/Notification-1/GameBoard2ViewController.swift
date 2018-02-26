//
//  GameBoard2ViewController.swift
//  Notification-1
//
//  Created by Sonny on 2018/2/12.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import UIKit
import GameplayKit


protocol Game2FeedbackHPDelegate {
    func game2ShowHP(leftHP:Int,rightHP:Int)
}


class GameBoard2ViewController: UIViewController {
    
    
    //宣告全域變數delegate 型別為上面的 protocol
    var game2FeedbackHPDelegate:Game2FeedbackHPDelegate?
    let joker = Joker()
    let hulk = Hulk()
    var player = ["joker","hulk"]
    
    
    var hitName:String!
    
    var p3HpLabel:UILabel = UILabel()
    var p4HpLabel:UILabel = UILabel()
    var winImage3 : UIImageView!
    var winImage4 : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        layoutSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func layoutSetting() {
        let p3NameLabel = UILabel(frame:CGRect(x: 50, y: 150, width: 100, height: 50))
        p3NameLabel.backgroundColor = UIColor.darkGray
        p3NameLabel.text = hulk.name
        p3NameLabel.textColor = UIColor.white
        p3NameLabel.textAlignment = .center
        
        let p4NameLabel = UILabel(frame:CGRect(x: 200, y: 150, width: 100, height: 50))
        p4NameLabel.backgroundColor = UIColor.darkGray
        p4NameLabel.text = joker.name
        p4NameLabel.textColor = UIColor.white
        p4NameLabel.textAlignment = .center
        
        p3HpLabel = UILabel(frame:CGRect(x: 50, y: 250, width: 100, height: 50))
        p3HpLabel.backgroundColor = UIColor.white
        p3HpLabel.text = String(hulk.hp)
        p3HpLabel.textColor = UIColor.red
        p3HpLabel.textAlignment = .center
        
        p4HpLabel = UILabel(frame:CGRect(x: 200, y: 250, width: 100, height: 50))
        p4HpLabel.backgroundColor = UIColor.white
        p4HpLabel.text = String(joker.hp)
        p4HpLabel.textColor = UIColor.red
        p4HpLabel.textAlignment = .center
        
        
        
        
        
        let image3 = UIImageView(frame:CGRect(x: 50, y: 300, width: 100, height: 100))
        image3.image = UIImage(named:hulk.imageName)
        
        let image4 = UIImageView(frame:CGRect(x: 200, y: 300, width: 100, height: 100))
        image4.image = UIImage(named:joker.imageName)
        
        
        winImage3 = UIImageView(frame:CGRect(x: 50, y: 400, width: 100, height: 100))
        winImage3.image = UIImage(named:"win.png")
        winImage3.alpha = 0
        
        winImage4 = UIImageView(frame:CGRect(x: 200, y: 400, width: 100, height: 100))
        winImage4.image = UIImage(named:"win.png")
        winImage4.alpha = 0

        
        
        self.view.addSubview(p3NameLabel)
        self.view.addSubview(p4NameLabel)
        self.view.addSubview(p3HpLabel)
        self.view.addSubview(p4HpLabel)
        self.view.addSubview(image3)
        self.view.addSubview(image4)
        self.view.addSubview(winImage3)
        self.view.addSubview(winImage4)
        
    }//endof layoutSetting
    
    //強迫初始化 tabBar
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //        NotificationCenter.default.addObserver(self, selector: #selector(hitPlayer), name: .gameStart, object: nil)
    //    }
    
    
    //init by coding
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        layoutSetting()
        
        // notification
        NotificationCenter.default.addObserver(self, selector: #selector(hitPlayer), name: .gameStart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(gameReset), name: .gameReset, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //random hit the player
    func randomHit() -> String {
        
        let randomDistribution = GKShuffledDistribution(lowestValue:0,highestValue: player.count-1)
        
        let index  = randomDistribution.nextInt()
        hitName = player[index]
        //        print("randomHit - \(hitName)")
        return hitName!
        
    }//endofthe randomHit
    
    @objc func hitPlayer() {
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            self.randomHit()
            //                print("In forLoop")
            //                sleep(1)
            if self.hulk.hp <= 0 {
                print("In Hulk hp")
                print("HulkHP - \(self.hulk.hp) , jokerHP - \(self.joker.hp)")
                timer.invalidate()
                self.winImage4!.alpha = 1
                self.view.backgroundColor = UIColor.red
            }else if self.joker.hp <= 0 {
                print("In joker hp")
                print("HulkHP - \(self.hulk.hp) , jokerHP - \(self.joker.hp)")
                timer.invalidate()
                self.winImage3.alpha = 1
                self.view.backgroundColor = UIColor.red
                
            }else {
                switch self.hitName {
                case "hulk":
                    self.hulk.hp -= self.joker.atk
                    self.p3HpLabel.text = String(self.hulk.hp)
                    print("deadpool atk")
                    print("spidermanHP - \(self.hulk.hp) , deadpoolHP - \(self.joker.hp)")
                default :
                    self.joker.hp -= self.hulk.atk
                    self.p4HpLabel.text = String(self.joker.hp)
                    print("ironman atk")
                    print("spidermanHP - \(self.hulk.hp) , deadpoolHP - \(self.joker.hp)")
                    
                }//endof switch
            }
            self.game2FeedbackHPDelegate?.game2ShowHP(leftHP: self.hulk.hp, rightHP: self.joker.hp)
            }.fire()
        //endof forloop
        
    }//endof hitPlayer
    
    @objc func gameReset() {
        hulk.hp  = hulk.originalhp
        joker.hp = joker.originalhp
        winImage3.alpha = 0
        winImage4.alpha = 0
        p3HpLabel.text = String(hulk.originalhp)
        p4HpLabel.text = String(joker.originalhp)
        view.backgroundColor = UIColor.white
        
    }//endof gameReset
    
    
    
    
    
    
    
    
    
    
    

}
