//
//  ViewController.swift
//  Game02
//
//  Created by 高菘駿 on 2018/2/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, game1FeedBackData, game2FeedBackData, game3FeedBackData {

    let gameRound = ["Game 1", "Game 2", "Game 3"]
    var leftHPs: [Int] = [0, 0, 0]
    var leftLossHPs: [String] = ["", "", ""]
    var healHPs: [String] = ["", "", ""]
    var leftMPs: [Int] = [0, 0, 0]
    var rightHPs: [Int] = [0, 0, 0]
    var rightMPs: [Int] = [0, 0, 0]
    var winners: [String] = ["", "", ""]
    var characters: [String: Any] = [:]
    
    @IBOutlet var gameTableView: UITableView!
    @IBAction func startButton(_ sender: Any) {
        
        let warrior = Character(HP: 50, MP: 10, damage: 5)
        let priest = Character(HP: 30, MP: 30, damage: 3)
        let magician = Character(HP: 20, MP: 50, damage: 8)
        let monster1 = Character(HP: 100, MP: 20, damage: 3)
        let monster2 = Character(HP: 100, MP: 20, damage: 3)
        let monster3 = Character(HP: 100, MP: 20, damage: 3)
        
        characters = ["game1Left": warrior, "game2Left": priest, "game3Left": magician, "monster1" : monster1, "monster2": monster2, "monster3": monster3]
//        leftHPs = [characters["game1Left"]!.HP, characters["game2Left"]!.HP, characters["game3Left"]!.HP]
        
        winners = ["", "", ""]
        NotificationCenter.default.post(name: .gameStart, object: nil, userInfo: characters)
        gameTableView.reloadData()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        let warrior = Character(HP: 50, MP: 10, damage: 4)
        let priest = Character(HP: 30, MP: 30, damage: 3)
        let magician = Character(HP: 20, MP: 50, damage: 10)
        let monster1 = Character(HP: 100, MP: 20, damage: 3)
        let monster2 = Character(HP: 100, MP: 20, damage: 3)
        let monster3 = Character(HP: 100, MP: 20, damage: 3)
        
        characters = ["game1Left": warrior, "game2Left": priest, "game3Left": magician, "monster1" : monster1, "monster2": monster2, "monster3": monster3]
        //        leftHPs = [characters["game1Left"]!.HP, characters["game2Left"]!.HP, characters["game3Left"]!.HP]
        leftHPs = [warrior.HP, priest.HP, magician.HP]
        leftMPs = [warrior.MP, priest.MP, magician.MP]
        
        rightHPs = [monster1.HP, monster2.HP, monster3.HP]
        rightMPs = [monster1.MP, monster2.MP, monster3.MP]
        winners = ["", "", ""]
        gameTableView.reloadData()
    }
    
    func game1ShowHP(leftHP: Int, rightHP: Int, leftLossHP: Int, rightLossHP: Int) {
        if leftHP == 0 {
            //leftLossHPs[0] = ""
            winners[0] = "Monster Win!!"
        } else {
            leftLossHPs[0] = "\(0 - leftLossHP)"
        }
        if rightHP == 0 {
            winners[0] = "Hero Win!!"
        }
        leftHPs[0] = leftHP
        rightHPs[0] = rightHP

        gameTableView.reloadData()
    }
    
    func game1ShowMP(leftMP: Int, rightMP: Int, leftLossMP: Int, rightLossMP: Int) {
        leftMPs[0] = leftMP
        rightMPs[0] = rightMP

        gameTableView.reloadData()
    }
    
    func game2ShowHP(leftHP: Int, rightHP: Int, leftLossHP: Int, rightLossHP: Int) {
        if leftHP == 0 {
            //leftLossHPs[1] = ""
            winners[1] = "Monster Win!!"
        } else {
        leftLossHPs[1] = "\(0 - leftLossHP)"
        }
        if rightHP == 0 {
            winners[1] = "Hero Win!!"
        }
        leftHPs[1] = leftHP
        rightHPs[1] = rightHP

        gameTableView.reloadData()
    }
    
    func game2ShowMP(leftMP: Int, rightMP: Int, leftLossMP: Int, rightLossMP: Int) {
        leftMPs[1] = leftMP
        rightMPs[1] = rightMP
        gameTableView.reloadData()
    }
    
    func game2Heal(healHP: Int) {
        healHPs[1] = "+\(healHP)"
    }
    
    func game3ShowHP(leftHP: Int, rightHP: Int, leftLossHP: Int, rightLossHP: Int) {
        if leftHP == 0 {
            winners[2] = "Monster Win!!"
        } else if rightHP == 0 {
            winners[2] = "Hero Win!!"
        }
        
        if leftLossHP != 0 {
            leftLossHPs[2] = "\(0 - leftLossHP)"
        } else {
            leftLossHPs[2] = ""
        }
        
        leftHPs[2] = leftHP
        rightHPs[2] = rightHP

        gameTableView.reloadData()
    }
    
    func game3ShowMP(leftMP: Int, rightMP: Int, leftLossMP: Int, rightLossMP: Int) {
        leftMPs[2] = leftMP
        rightMPs[2] = rightMP
        gameTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let atkVC = tabBarController?.viewControllers![1] as! ATKViewController
        atkVC.delegate = self
        let defVC = tabBarController?.viewControllers![2] as! DEFViewController
        defVC.delegate = self
        let matkVC = tabBarController?.viewControllers![3] as! MATKViewController
        matkVC.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.gameNameLabel.text = gameRound[indexPath.row]
        cell.leftCharacterHP.text = "HP:\(leftHPs[indexPath.row])"
        
        cell.leftCharacterMP.text = "MP:\(leftMPs[indexPath.row])"
        cell.rightCharacterHP.text = "HP:\(rightHPs[indexPath.row])"
        cell.rightCharacterMP.text = "MP:\(rightMPs[indexPath.row])"
        cell.winnerLabel.text = winners[indexPath.row]
        //self.view.addSubview(cell.lossHP)
        if leftLossHPs[0] != "0" || leftLossHPs[1] != "0" || leftLossHPs[2] != "0" {
            let lossHPOrigin = cell.lossHP.frame.origin
            let increaseHPOrigin = cell.increaseHP.frame.origin
            //let hpLabel.origin = cell.leftCharacterHP.frame.origin
            cell.lossHP.alpha = 1
            cell.increaseHP.alpha = 1
            UIView.animate(withDuration: 1, animations: {
                cell.lossHP.text = "\(self.leftLossHPs[indexPath.row])"
                cell.lossHP.frame.origin = CGPoint(x: lossHPOrigin.x - 5, y: lossHPOrigin.y - 5 )
                cell.increaseHP.text = "\(self.healHPs[indexPath.row])"
                cell.increaseHP.frame.origin = CGPoint(x:increaseHPOrigin.x - 5, y: increaseHPOrigin.y - 10)
                cell.lossHP.alpha = 0
                cell.increaseHP.alpha = 0
            }, completion: { (finish) in
                self.leftLossHPs = ["", "", ""]
                self.healHPs = ["", "", ""]
            })
            
            cell.lossHP.frame.origin = lossHPOrigin
            cell.increaseHP.frame.origin = increaseHPOrigin
        }
        return cell
    }

}

extension Notification.Name {
    static let gameStart = Notification.Name("gameStart")
//    static let leftCharacterDecreaseHP = Notification.Name("leftCharacterDecreaseHP")
//    static let leftCharacterDecreaseMP = Notification.Name("leftCharacterDecreaseMP")
//    static let rightCharacterDecreaseHP = Notification.Name("rightCharacterDecreaseHP")
//    static let rightCharacterDecreaseMP = Notification.Name("rightCharacterDecreaseMP")
}
