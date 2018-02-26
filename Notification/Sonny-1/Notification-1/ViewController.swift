//
//  ViewController.swift
//  Notification-1
//
//  Created by Sonny on 2018/2/12.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import UIKit



class ViewController: UIViewController ,Game1FeedbackHPDelegate,Game2FeedbackHPDelegate,Game3FeedbackHPDelegate{

    let fullSize = UIScreen.main.bounds.size
    let batman = Batman()
    let joker = Joker()
    let ironman = Ironman()
    let spiderman = Spiderman()
    let hulk = Hulk()
    let deadpool = Deadpool()
    var p1HpLabel:UILabel=UILabel()
    var p2HpLabel:UILabel=UILabel()
    var p3HpLabel:UILabel=UILabel()
    var p4HpLabel:UILabel=UILabel()
    var p5HpLabel:UILabel=UILabel()
    var p6HpLabel:UILabel=UILabel()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutSetting()
        
        let secondVC = tabBarController?.viewControllers![1] as! GameBoard1ViewController
        secondVC.game1FeedbackHPDelegate = self
        let thirdVC = tabBarController?.viewControllers![2] as! GameBoard2ViewController
        thirdVC.game2FeedbackHPDelegate = self
        let fourthVC = tabBarController?.viewControllers![3] as! GameBoard3ViewController
        fourthVC.game3FeedbackHPDelegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func layoutSetting() {
        let p1NameLabel = UILabel(frame:CGRect(x: 50, y: 100, width: 100, height: 25))
        p1NameLabel.backgroundColor = UIColor.clear
        p1NameLabel.text = batman.name
        p1NameLabel.textColor = UIColor.white
        p1NameLabel.textAlignment = .center
        
        let p2NameLabel = UILabel(frame:CGRect(x: 200, y: 100, width: 100, height: 25))
        p2NameLabel.backgroundColor = UIColor.clear
        p2NameLabel.text = ironman.name
        p2NameLabel.textColor = UIColor.white
        p2NameLabel.textAlignment = .center
        
        let p3NameLabel = UILabel(frame:CGRect(x: 50, y: 250, width: 100, height: 25))
        p3NameLabel.backgroundColor = UIColor.clear
        p3NameLabel.text = hulk.name
        p3NameLabel.textColor = UIColor.white
        p3NameLabel.textAlignment = .center
        
        let p4NameLabel = UILabel(frame:CGRect(x: 200, y: 250, width: 100, height: 25))
        p4NameLabel.backgroundColor = UIColor.clear
        p4NameLabel.text = joker.name
        p4NameLabel.textColor = UIColor.white
        p4NameLabel.textAlignment = .center
        
        let p5NameLabel = UILabel(frame:CGRect(x: 50, y: 400, width: 100, height: 25))
        p5NameLabel.backgroundColor = UIColor.clear
        p5NameLabel.text = spiderman.name
        p5NameLabel.textColor = UIColor.white
        p5NameLabel.textAlignment = .center
        
        let p6NameLabel = UILabel(frame:CGRect(x: 200, y: 400, width: 100, height: 25))
        p6NameLabel.backgroundColor = UIColor.clear
        p6NameLabel.text = deadpool.name
        p6NameLabel.textColor = UIColor.white
        p6NameLabel.textAlignment = .center
        
        
        let image1 = UIImageView(frame:CGRect(x: 50, y: 150, width: 100, height: 100))
        image1.image = UIImage(named:batman.imageName)
        
        let image2 = UIImageView(frame:CGRect(x: 200, y: 150, width: 100, height: 100))
        image2.image = UIImage(named:ironman.imageName)
        
        let image3 = UIImageView(frame:CGRect(x: 50, y: 300, width: 100, height: 100))
        image3.image = UIImage(named:hulk.imageName)
        
        let image4 = UIImageView(frame:CGRect(x: 200, y: 300, width: 100, height: 100))
        image4.image = UIImage(named:joker.imageName)
        
        let image5 = UIImageView(frame:CGRect(x: 50, y: 450, width: 100, height: 100))
        image5.image = UIImage(named:spiderman.imageName)
        
        let image6 = UIImageView(frame:CGRect(x: 200, y: 450, width: 100, height: 100))
        image6.image = UIImage(named:deadpool.imageName)
        
        let button1 = UIButton(frame:CGRect(x: 50, y: 560, width: 100, height: 40))
            button1.setTitle("START All", for: .normal)
            button1.setTitleColor(.black, for: .normal)
            button1.backgroundColor = UIColor.red
            button1.layer.cornerRadius = 20
            button1.addTarget(self, action: #selector(gameStart), for: .touchUpInside)
        
        let button2 = UIButton(frame:CGRect(x: 200, y: 560, width: 100, height: 40))
            button2.setTitle("Reset All", for: .normal)
            button2.setTitleColor(.black, for: .normal)
            button2.backgroundColor = UIColor.red
            button2.layer.cornerRadius = 20
            button2.addTarget(self, action: #selector(allGameReset), for: .touchUpInside)
        
        
        p1HpLabel = UILabel(frame:CGRect(x: 80, y: 125, width: 100, height: 25))
            p1HpLabel.textColor = UIColor.green
            p1HpLabel.text = String(batman.hp)
        
        p2HpLabel = UILabel(frame:CGRect(x: 230, y: 125, width: 100, height: 25))
            p2HpLabel.textColor = UIColor.green
            p2HpLabel.text = String(ironman.hp)
        
        p3HpLabel = UILabel(frame:CGRect(x: 10, y: 300, width: 45, height: 100))
        p3HpLabel.textColor = UIColor.green
        p3HpLabel.text = String(hulk.hp)
        
        p4HpLabel = UILabel(frame:CGRect(x: 300, y: 300, width: 45, height: 100))
        p4HpLabel.textColor = UIColor.green
        p4HpLabel.text = String(joker.hp)
        
        p5HpLabel = UILabel(frame:CGRect(x: 10, y: 450, width: 45, height: 100))
        p5HpLabel.textColor = UIColor.green
        p5HpLabel.text = String(spiderman.hp)
        
        p6HpLabel = UILabel(frame:CGRect(x: 300, y: 450, width: 45, height: 100))
        p6HpLabel.textColor = UIColor.green
        p6HpLabel.text = String(deadpool.hp)
        
        
        view.addSubview(p1NameLabel)
        view.addSubview(p2NameLabel)
        view.addSubview(p3NameLabel)
        view.addSubview(p4NameLabel)
        view.addSubview(p5NameLabel)
        view.addSubview(p6NameLabel)
        view.addSubview(image1)
        view.addSubview(image2)
        view.addSubview(image3)
        view.addSubview(image4)
        view.addSubview(image5)
        view.addSubview(image6)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(p1HpLabel)
        view.addSubview(p2HpLabel)
        view.addSubview(p3HpLabel)
        view.addSubview(p4HpLabel)
        view.addSubview(p5HpLabel)
        view.addSubview(p6HpLabel)

        
        
        
    }//endof layoutSetting

    //post Notification
    @objc func gameStart() {
        NotificationCenter.default.post(name: .gameStart, object: nil)
    }
    
    @objc func allGameReset() {
        NotificationCenter.default.post(name: .gameReset, object: nil)
        p1HpLabel.text = "\(batman.originalhp)"
        p2HpLabel.text = "\(ironman.originalhp)"
        p3HpLabel.text = "\(hulk.originalhp)"
        p4HpLabel.text = "\(joker.originalhp)"
        p5HpLabel.text = "\(spiderman.originalhp)"
        p6HpLabel.text = "\(deadpool.originalhp)"
        
    }
    
    func game1ShowHP(leftHP: Int, rightHP: Int) {
        p1HpLabel.text = "\(leftHP)"
        p2HpLabel.text = "\(rightHP)"
    }
    
    func game2ShowHP(leftHP: Int, rightHP: Int) {
        p3HpLabel.text = "\(leftHP)"
        p4HpLabel.text = "\(rightHP)"
    }
    
    func game3ShowHP(leftHP: Int, rightHP: Int) {
        p5HpLabel.text = "\(leftHP)"
        p6HpLabel.text = "\(rightHP)"
    }
    
}//endof class

//Notification Naming
extension Notification.Name {
    static let gameStart = Notification.Name("gameStart")
    static let gameReset = Notification.Name("gameReset")
}
