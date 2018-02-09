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
//  var apollo = Apollo()
//  var mars = Mars()
//  var neptunus = Neptunus()
//  var jupiter = Jupiter()
  
  lazy var actions: [Action] = [Paper(), Scissors(), Stone()]
  lazy var playerLists: [Character] = [Apollo(), Mars(), Neptunus(), Jupiter()]
  var currentPlayer: Character!

  // Actor
  @IBOutlet weak var actorHpLabel: UILabel!
  @IBOutlet weak var actorAttackLabel: UILabel!
  @IBOutlet weak var actorNameLabel: UILabel!
  @IBOutlet weak var actorImgView: UIImageView!
  @IBOutlet weak var actorActImgView: UIImageView!
  
  // Boss
  @IBOutlet weak var bossHpLabel: UILabel!
  @IBOutlet weak var bossAttackLabel: UILabel!
  @IBOutlet weak var bossNameLabel: UILabel!
  @IBOutlet weak var bossImgView: UIImageView!
  @IBOutlet weak var bossActImgView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    titan.infoDelegate = self
    for player in playerLists {
      player.infoDelegate = self
      player.actionDelegate = self
    }
    
    getCurrentPlayer()
    showCharacter()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func switchCharacter(_ sender: Any) {
    getCurrentPlayer()
    showPlayers()
  }
  
  func getCurrentPlayer() {
    let playerNum = Int(arc4random_uniform(UInt32(playerLists.count)))
    currentPlayer = playerLists[playerNum]
  }
  
  func showCharacter() {
    showPlayers()
    showBoss()
  }
  
  func showPlayers() {
    currentPlayer.showPlayer()
    actorActImgView.image = nil
  }
  
  func showBoss() {
    titan.showBoss()
  }

  @IBAction func attackBtn(_ sender: Any) {
    currentPlayer.action(action: actions[0])
  }
  
  @IBAction func defenceBtn(_ sender: Any) {
    currentPlayer.action(action: actions[1])
  }
  
  @IBAction func counterAttack() {
    currentPlayer.action(action: actions[2])
  }
}

extension ViewController: UpdateCharacterInfo {
  func updatePlayerImg(image: UIImage) {
    actorImgView.image = image
  }
  
  func updatePlayerInfo(hpVal: Int, atkVal: Int, name: String) {
    actorHpLabel.text = String(hpVal)
    actorAttackLabel.text = String(atkVal)
    actorNameLabel.text = String(name)
  }
  
  func updateBossImg(image: UIImage) {
    bossImgView.image = image
  }
  
  func updateBossInfo(hpVal: Int, atkVal: Int, name: String) {
    bossHpLabel.text = String(hpVal)
    bossAttackLabel.text = String(atkVal)
    bossNameLabel.text = String(name)
  }
}

extension ViewController: ActionDelegate {
  func actionDidSelect(action: Action) {
    actorActImgView.image = UIImage(named: action.name)

    let bossAction = actions[Int(arc4random_uniform(3))]
    bossActImgView.image = UIImage(named: bossAction.name)

    
    
  }
  
  
}

