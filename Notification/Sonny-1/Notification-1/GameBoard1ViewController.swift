//
//  GameBoard1ViewController.swift
//  Notification-1
//
//  Created by Sonny on 2018/2/12.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import UIKit
import GameplayKit


protocol Game1FeedbackHPDelegate {
    func game1ShowHP(leftHP:Int,rightHP:Int)
}

class GameBoard1ViewController: UIViewController {
    
    //宣告全域變數delegate 型別為上面的 protocol
    var game1FeedbackHPDelegate:Game1FeedbackHPDelegate?
    
    let batman = Batman()
    let ironman = Ironman()
    var player = ["batman","ironman"]
    var hitName:String!
    
    var p1HpLabel:UILabel = UILabel()
    var p2HpLabel:UILabel = UILabel()
    var winImage1 : UIImageView!
    var winImage2 : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        layoutSetting()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func layoutSetting() {
        let p1NameLabel = UILabel(frame:CGRect(x: 50, y: 150, width: 100, height: 50))
        p1NameLabel.backgroundColor = UIColor.darkGray
        p1NameLabel.text = batman.name
        p1NameLabel.textColor = UIColor.white
        p1NameLabel.textAlignment = .center
        
        let p2NameLabel = UILabel(frame:CGRect(x: 200, y: 150, width: 100, height: 50))
        p2NameLabel.backgroundColor = UIColor.darkGray
        p2NameLabel.text = ironman.name
        p2NameLabel.textColor = UIColor.white
        p2NameLabel.textAlignment = .center
        
        p1HpLabel = UILabel(frame:CGRect(x: 50, y: 250, width: 100, height: 50))
        p1HpLabel.backgroundColor = UIColor.white
        p1HpLabel.text = String(batman.hp)
        p1HpLabel.textColor = UIColor.red
        p1HpLabel.textAlignment = .center
        
        p2HpLabel = UILabel(frame:CGRect(x: 200, y: 250, width: 100, height: 50))
        p2HpLabel.backgroundColor = UIColor.white
        p2HpLabel.text = String(ironman.hp)
        p2HpLabel.textColor = UIColor.red
        p2HpLabel.textAlignment = .center
        
        
        
        
        
        let image1 = UIImageView(frame:CGRect(x: 50, y: 300, width: 100, height: 100))
        image1.image = UIImage(named:batman.imageName)
        
        let image2 = UIImageView(frame:CGRect(x: 200, y: 300, width: 100, height: 100))
        image2.image = UIImage(named:ironman.imageName)
        
        winImage1 = UIImageView(frame:CGRect(x: 50, y: 400, width: 100, height: 100))
        winImage1.image = UIImage(named:"win.png")
        winImage1.alpha = 0
        
        winImage2 = UIImageView(frame:CGRect(x: 200, y: 400, width: 100, height: 100))
        winImage2.image = UIImage(named:"win.png")
        winImage2.alpha = 0
        
        
        self.view.addSubview(p1NameLabel)
        self.view.addSubview(p2NameLabel)
        self.view.addSubview(p1HpLabel)
        self.view.addSubview(p2HpLabel)
        self.view.addSubview(image1)
        self.view.addSubview(image2)
        self.view.addSubview(winImage1)
        self.view.addSubview(winImage2)
        
        
    }//endof layoutSetting
    
    //強迫初始化 tabBar
    //    required init?(coder aDecoder: NSCoder) {
    //        super.init(coder: aDecoder)
    //        NotificationCenter.default.addObserver(self, selector: #selector(hitPlayer), name: .gameStart, object: nil)
    //    }
    
    
    //init VC by coding
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        layoutSetting()
        
        // notification
        NotificationCenter.default.addObserver(self, selector: #selector(hitPlayer), name: .gameStart, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(gameReset), name: .gameReset, object: nil)
    }
    //init by stroyboard
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
            if self.batman.hp <= 0 {
                print("In batman hp")
                print("batmanHP - \(self.batman.hp) , ironmanHP - \(self.ironman.hp)")
                timer.invalidate()
                self.winImage2!.alpha = 1
                self.view.backgroundColor = UIColor.red
            }else if self.ironman.hp <= 0 {
                print("In ironman hp")
                print("self.batmanHP - \(self.batman.hp) , ironmanHP - \(self.ironman.hp)")
                timer.invalidate()
                self.winImage1.alpha = 1
                self.view.backgroundColor = UIColor.red
                
            }else {
                switch self.hitName {
                case "batman":
                    self.batman.hp -= self.ironman.atk
                    self.p1HpLabel.text = String(self.batman.hp)
                    print("ironman atk")
                    print("batmanmanHP - \(self.batman.hp) , ironmanHP - \(self.ironman.hp)")
                default :
                    self.ironman.hp -= self.batman.atk
                    self.p2HpLabel.text = String(self.ironman.hp)
                    print("ironman atk")
                    print("batmanHP - \(self.batman.hp) , ironmanHP - \(self.ironman.hp)")
                    
                }//endof switch
            }
            self.game1FeedbackHPDelegate?.game1ShowHP(leftHP: self.batman.hp, rightHP: self.ironman.hp)
            }.fire()
        //endof forloop
        
    }//endof hitPlayer
    
    @objc func gameReset() {
        batman.hp  = batman.originalhp
        ironman.hp = ironman.originalhp
        winImage1.alpha = 0
        winImage2.alpha = 0
        p1HpLabel.text = String(batman.originalhp)
        p2HpLabel.text = String(ironman.originalhp)
        view.backgroundColor = UIColor.white
        
    }//endof gameReset
    
    
    
    

}
