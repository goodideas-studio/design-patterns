//
//  DEFViewController.swift
//  Game02
//
//  Created by 高菘駿 on 2018/2/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

protocol game2FeedBackData {
    func game2ShowHP(leftHP: Int, rightHP: Int, leftLossHP: Int, rightLossHP: Int)
    func game2ShowMP(leftMP: Int, rightMP: Int, leftLossMP: Int, rightLossMP: Int)
    func game2Heal(healHP: Int)
}

import UIKit

class DEFViewController: UIViewController, showDataDelegate {

    @IBOutlet var leftCharacterHPLabel: UILabel!
    @IBOutlet var leftCharacterMPLabel: UILabel!
    @IBOutlet var rightCharacterHPLabel: UILabel!
    @IBOutlet var rightCharacterMPLabel: UILabel!
    @IBOutlet var leftCharacterImageView: UIImageView!
    @IBOutlet var leftAnimationImageView: UIImageView!
    @IBOutlet var leftAnimationImageView2: UIImageView! //been attacked
    @IBOutlet var rightCharacterImageView: UIImageView!
    @IBOutlet var rightAnimationImageView: UIImageView!
    
    var delegate: game2FeedBackData?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(gameStart), name: .gameStart, object: nil)
    }
 
    @objc func gameStart(note: Notification) {
        if let userInfo = note.userInfo {
            let leftCharacter = userInfo["game2Left"] as! Character
            let rightCharacter = userInfo["monster2"]  as! Character
            
            let gameBoard = GameBoard()
            gameBoard.delegate = self
            
            let leftSkill = ["DEF", "HEAL"]
            let leftAction = leftSkill[Int(arc4random_uniform(2))]
            let leftMaxDamage = Int(arc4random_uniform(10))
            let rightMaxDamge = Int(arc4random_uniform(5))
            
            var leftLossHP = 0
            var leftLossMP = 0
            let rightLossHP = 0
            let rightLossMP = 0
            
            if leftCharacter.HP > 0 && rightCharacter.HP > 0 {
                
                leftLossHP = rightCharacter.damage + rightMaxDamge
                leftLossMP = 4
                
                self.view.addSubview(leftAnimationImageView)
                self.view.addSubview(leftAnimationImageView2)
                leftAnimationImageView2.image = UIImage(named: "ATK")
                    
                UIView.animate(withDuration: 0.5, animations: {
                    switch leftAction {
                    case "DEF":
                        leftLossHP = leftLossHP / 2
                        self.leftAnimationImageView.image = UIImage(named: leftAction)
                    leftCharacter.HP = max(leftCharacter.HP - leftLossHP , 0)
                    case "HEAL":
                        if leftCharacter.MP > 4 {
                    self.leftAnimationImageView.image = UIImage(named: leftAction)
                            leftCharacter.HP = min(30,leftCharacter.HP + leftCharacter.damage + leftMaxDamage - leftLossHP)
                    leftCharacter.MP -= leftLossMP
                            self.delegate?.game2Heal(healHP: leftCharacter.damage + leftMaxDamage)
                        } else {
                            leftLossHP = leftLossHP / 2
                            self.leftAnimationImageView.image = UIImage(named: "DEF")
                            leftCharacter.HP = max(leftCharacter.HP - leftLossHP , 0)
                        }
                    default: break
                    } // switch end
                    self.leftCharacterImageView.center.x -= 10

                    }, completion: { (finish) in
                        
                        UIView.animate(withDuration: 0.5) {
                            self.leftCharacterImageView.center.x += 10
                        self.leftAnimationImageView.removeFromSuperview()
                        self.leftAnimationImageView2.removeFromSuperview()
                        }
                    })
                    
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.gameStart(note: note)
                }
            }
            
            //會由GameBoard回傳血量並顯示在畫面上
            gameBoard.setCharacter(leftCharacter: leftCharacter, rightCharacter: rightCharacter)
            //回傳HP MP 給 HomeViewController
            delegate?.game2ShowHP(leftHP: leftCharacter.HP, rightHP: rightCharacter.HP, leftLossHP: leftLossHP, rightLossHP: rightLossHP)
            delegate?.game2ShowMP(leftMP: leftCharacter.MP, rightMP: rightCharacter.MP, leftLossMP: leftLossMP, rightLossMP: rightLossMP)
        }
    }
    
    func showHP(leftHP: Int, rightHP: Int) {
        leftCharacterHPLabel.text = "HP:\(leftHP)"
        rightCharacterHPLabel.text = "HP:\(rightHP)"
    }
    
    func showMP(leftMP: Int, rightMP: Int) {
        leftCharacterMPLabel.text = "MP:\(leftMP)"
        rightCharacterMPLabel.text = "MP:\(rightMP)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        leftCharacterHPLabel.text = "not ready"
        leftCharacterMPLabel.text = "not ready"
        rightCharacterHPLabel.text = "not ready"
        rightCharacterMPLabel.text = "not ready"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
