//
//  GameBoard3ViewController.swift
//  Notification-1
//
//  Created by Sonny on 2018/2/12.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import UIKit
import GameplayKit

protocol Game3FeedbackHPDelegate {
    func game3ShowHP(leftHP:Int,rightHP:Int)
}

class GameBoard3ViewController: UIViewController {
    
    //宣告全域變數delegate 型別為上面的 protocol
    var game3FeedbackHPDelegate:Game3FeedbackHPDelegate?
    
    let spiderman = Spiderman()
    let deadpool = Deadpool()
    var player = ["spiderman","deadpool"]
    var hitName:String!
    
    var p5HpLabel:UILabel = UILabel()
    var p6HpLabel:UILabel = UILabel()
    var winImage5 : UIImageView!
    var winImage6 : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

//        layoutSetting()

//        hitPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func layoutSetting() {
        let p5NameLabel = UILabel(frame:CGRect(x: 50, y: 150, width: 100, height: 50))
        p5NameLabel.backgroundColor = UIColor.darkGray
        p5NameLabel.text = spiderman.name
        p5NameLabel.textColor = UIColor.white
        p5NameLabel.textAlignment = .center
        
        let p6NameLabel = UILabel(frame:CGRect(x: 200, y: 150, width: 100, height: 50))
        p6NameLabel.backgroundColor = UIColor.darkGray
        p6NameLabel.text = deadpool.name
        p6NameLabel.textColor = UIColor.white
        p6NameLabel.textAlignment = .center
        
        p5HpLabel = UILabel(frame:CGRect(x: 50, y: 250, width: 100, height: 50))
        p5HpLabel.backgroundColor = UIColor.white
        p5HpLabel.text = String(spiderman.hp)
        p5HpLabel.textColor = UIColor.red
        p5HpLabel.textAlignment = .center
        
        p6HpLabel = UILabel(frame:CGRect(x: 200, y: 250, width: 100, height: 50))
        p6HpLabel.backgroundColor = UIColor.white
        p6HpLabel.text = String(deadpool.hp)
        p6HpLabel.textColor = UIColor.red
        p6HpLabel.textAlignment = .center
        
        
        
        
        
        let image5 = UIImageView(frame:CGRect(x: 50, y: 300, width: 100, height: 100))
        image5.image = UIImage(named:spiderman.imageName)
        
        let image6 = UIImageView(frame:CGRect(x: 200, y: 300, width: 100, height: 100))
        image6.image = UIImage(named:deadpool.imageName)
        
        
        winImage5 = UIImageView(frame:CGRect(x: 50, y: 400, width: 100, height: 100))
        winImage5.image = UIImage(named:"win.png")
        winImage5.alpha = 0
        
        winImage6 = UIImageView(frame:CGRect(x: 200, y: 400, width: 100, height: 100))
        winImage6.image = UIImage(named:"win.png")
        winImage6.alpha = 0
        
        
        self.view.addSubview(p5NameLabel)
        self.view.addSubview(p6NameLabel)
        self.view.addSubview(p5HpLabel)
        self.view.addSubview(p6HpLabel)
        self.view.addSubview(image5)
        self.view.addSubview(image6)
        self.view.addSubview(winImage5)
        self.view.addSubview(winImage6)
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
                if self.spiderman.hp <= 0 {
                    print("In spiderman hp")
                    print("spidermanHP - \(self.spiderman.hp) , deadpoolHP - \(self.deadpool.hp)")
                    timer.invalidate()
                    self.winImage6!.alpha = 1
                    self.view.backgroundColor = UIColor.red
                }else if self.deadpool.hp <= 0 {
                    print("In deadpool hp")
                    print("self.spidermanHP - \(self.spiderman.hp) , deadpoolHP - \(self.deadpool.hp)")
                    timer.invalidate()
                    self.winImage5.alpha = 1
                    self.view.backgroundColor = UIColor.red
                    
                }else {
                    switch self.hitName {
                    case "spiderman":
                        self.spiderman.hp -= self.deadpool.atk
                        self.p5HpLabel.text = String(self.spiderman.hp)
                        print("deadpool atk")
                        print("spidermanHP - \(self.spiderman.hp) , deadpoolHP - \(self.deadpool.hp)")
                    default :
                        self.deadpool.hp -= self.spiderman.atk
                        self.p6HpLabel.text = String(self.deadpool.hp)
                        print("ironman atk")
                        print("spidermanHP - \(self.spiderman.hp) , deadpoolHP - \(self.deadpool.hp)")
                        
                    }//endof switch
            }
            self.game3FeedbackHPDelegate?.game3ShowHP(leftHP: self.spiderman.hp, rightHP: self.deadpool.hp)
        }.fire()
        //endof timer
    }//endof hitPlayer
    
    @objc func gameReset() {    
    spiderman.hp  = spiderman.originalhp
    deadpool.hp = deadpool.originalhp
        winImage5.alpha = 0
        winImage6.alpha = 0
         p5HpLabel.text = String(spiderman.originalhp)
        p6HpLabel.text = String(deadpool.originalhp)
        view.backgroundColor = UIColor.white
        
    }//endof gameReset
    
    
    
        
}//endof class
