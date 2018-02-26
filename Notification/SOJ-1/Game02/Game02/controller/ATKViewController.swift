//
//  ATKViewController.swift
//  Game02
//
//  Created by 高菘駿 on 2018/2/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

protocol game1FeedBackData {
    func game1ShowHP(leftHP: Int, rightHP: Int, leftLossHP: Int, rightLossHP: Int)
    func game1ShowMP(leftMP: Int, rightMP: Int, leftLossMP: Int, rightLossMP: Int)
}

class ATKViewController: UIViewController, showDataDelegate {

    @IBOutlet var leftCharacterHPLabel: UILabel!
    @IBOutlet var leftCharacterMPLabel: UILabel!
    @IBOutlet var rightCharacterHPLabel: UILabel!
    @IBOutlet var rightCharacterMPLabel: UILabel!
    @IBOutlet var leftCharacterImageView: UIImageView!
    @IBOutlet var leftAnimationImageView: UIImageView!
    @IBOutlet var rightCharacterImageView: UIImageView!
    @IBOutlet var rightAnimationImageView: UIImageView!
    
    var delegate: game1FeedBackData?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(gameStart), name: .gameStart, object: nil)
    }
    
    @objc func gameStart(note: Notification) {
        if let userInfo = note.userInfo {
        let leftCharacter = userInfo["game1Left"] as! Character
        let rightCharacter = userInfo["monster1"]  as! Character
            
            let gameBoard = GameBoard()
            gameBoard.delegate = self
            
            let leftMaxDamage = Int(arc4random_uniform(10))
            let rightMaxDamge = Int(arc4random_uniform(5))
            
            var leftLossHP = 0
            var leftLossMP = 0
            var rightLossHP = 0
            var rightLossMP = 0

        if leftCharacter.HP > 0 && rightCharacter.HP > 0 {
            
            leftLossHP = rightCharacter.damage + rightMaxDamge
            rightLossHP = leftCharacter.damage + leftMaxDamage
            
            self.view.addSubview(leftAnimationImageView)
            self.view.addSubview(rightAnimationImageView)
            leftAnimationImageView.image = UIImage(named: "ATK")
            rightAnimationImageView.image = UIImage(named: "ATK")
            
            UIView.animate(withDuration: 0.5, animations: {
                rightCharacter.HP = max(rightCharacter.HP - rightLossHP, 0)
                leftCharacter.HP = max(leftCharacter.HP - leftLossHP, 0)
                self.leftCharacterImageView.center.x -= 10
                self.rightCharacterImageView.center.x += 10
            }, completion: { (finish) in
                
                UIView.animate(withDuration: 0.5) {
                    self.leftCharacterImageView.center.x += 10
                    self.rightCharacterImageView.center.x -= 10
                    self.leftAnimationImageView.removeFromSuperview()
                    self.rightAnimationImageView.removeFromSuperview()
                }
            })
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.gameStart(note: note)
            }
        }
            

//會由GameBoard回傳血量並顯示在畫面上
            gameBoard.setCharacter(leftCharacter: leftCharacter, rightCharacter: rightCharacter)
//回傳HP MP 給 HomeViewController
            delegate?.game1ShowHP(leftHP: leftCharacter.HP, rightHP: rightCharacter.HP, leftLossHP: leftLossHP, rightLossHP: rightLossHP)
            delegate?.game1ShowMP(leftMP: leftCharacter.MP, rightMP: rightCharacter.MP, leftLossMP: leftLossMP, rightLossMP: rightLossMP)
        }
    }
    
//delegate
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
