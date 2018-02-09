//
//  ViewController.swift
//  Game
//
//  Created by PinguMac on 2018/2/8.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var titan = Titan()
  var apollo = Apollo()
  var mars = Mars()
  var neptunus = Neptunus()
  var jupiter = Jupiter()
  
  lazy var playerLists: [Character] = [apollo, mars, neptunus, jupiter]
  
  var defaultAction: Int = 0

  // Character
  @IBOutlet weak var characterHpLabel: UILabel!
  @IBOutlet weak var characterAttackLabel: UILabel!
  @IBOutlet weak var characterNameLabel: UILabel!
  @IBOutlet weak var characterImgView: UIImageView!
  
  // Boss
  @IBOutlet weak var bossHpLabel: UILabel!
  @IBOutlet weak var bossAttackLabel: UILabel!
  @IBOutlet weak var bossNameLabel: UILabel!
  @IBOutlet weak var bossImgView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    titan.delegate = self
    for player in playerLists {
      player.delegate = self
    }
    showCharacter()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func switchCharacter(_ sender: Any) {
    showPlayers()
  }
  
  func showCharacter() {
    showPlayers()
    showBoss()
  }
  
  func showPlayers() {
    let playerNum = Int(arc4random_uniform(UInt32(playerLists.count)))
    playerLists[playerNum].showPlayer(action: defaultAction)
  }
  
  func showBoss() {
    titan.showBoss(action: defaultAction)
  }

  @IBAction func attackBtn(_ sender: Any) {
    
  }
  
  @IBAction func defenceBtn(_ sender: Any) {
    
  }
  
  @IBAction func counterAttack() {
    
  }
}

extension ViewController: UpdateCharacterInfo {
  func updatePlayerImg(action: Int, image: UIImage) {
    characterImgView.image = image
  }
  
  func updatePlayerInfo(hpVal: Int, atkVal: Int, name: String) {
    characterHpLabel.text = String(hpVal)
    characterAttackLabel.text = String(atkVal)
    characterNameLabel.text = String(name)
  }
  
  func updateBossImg(action: Int, image: UIImage) {
    bossImgView.image = image
  }
  
  func updateBossInfo(hpVal: Int, atkVal: Int, name: String) {
    bossHpLabel.text = String(hpVal)
    bossAttackLabel.text = String(atkVal)
    bossNameLabel.text = String(name)
  }
}

