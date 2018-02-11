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
  lazy var actions: [Action] = [Attack(), Defence(), CounterAttack()]
  lazy var playerLists: [Character] = [Apollo(), Mars(), Neptunus(), Jupiter()]
  var currentCharacter: Character!

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
  
  @IBOutlet weak var switchCharacterBtn: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    titan.infoDelegate = self
    for player in playerLists {
      player.infoDelegate = self
      player.actionDelegate = self
    }
    
    randomPlayer()
    showCharacters()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func switchCharacter() {
    randomPlayer()
    showPlayers()
  }
  
  func randomPlayer() {
    let playerNum = Int(arc4random_uniform(UInt32(playerLists.count)))
    currentCharacter = playerLists[playerNum]
  }
  
  func showCharacters() {
    showPlayers()
    showBoss()
  }
  
  func showPlayers() {
    currentCharacter.showPlayer()
    actorActImgView.image = nil
  }
  
  func showBoss() {
    titan.showBoss()
  }
  
  func gameReset() {
    titan.resetCharacter()
    bossActImgView.image = nil
    currentCharacter.resetCharacter()
    
    showPlayers()
    showBoss()
  }

  @IBAction func attackBtn(_ sender: Any) {
    switchCharacterBtn.isEnabled = false
    currentCharacter.action(action: actions[0])
  }
  
  @IBAction func defenceBtn(_ sender: Any) {
    switchCharacterBtn.isEnabled = false
    currentCharacter.action(action: actions[1])
  }
  
  @IBAction func counterAttack() {
    switchCharacterBtn.isEnabled = false
    currentCharacter.action(action: actions[2])
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
  func actionDidSelect(actorAction: Action) {
    actorActImgView.image = UIImage(named: actorAction.name)

    let bossAction = actions[Int(arc4random_uniform(3))]
    bossActImgView.image = UIImage(named: bossAction.name)
    
    switch GameCondition.execute(actorAction: actorAction, bossAction: bossAction) {
    case .Tie:
      print("Tie")
    case .Win:
      titan.hpVal = max(titan.hpVal - currentCharacter.atkVal, 0)
      bossHpLabel.text = String(titan.hpVal)
    case .Lose:
      currentCharacter.hpVal = max(currentCharacter.hpVal - titan.atkVal, 0)
      actorHpLabel.text = String(currentCharacter.hpVal)
    }
    
    if currentCharacter.hpVal == 0 || titan.hpVal == 0 {
      let alert = UIAlertController(title: "Game Over!", message: "Restart Game.", preferredStyle: UIAlertControllerStyle.alert)
      alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { _ in
        self.switchCharacterBtn.isEnabled = true
        self.gameReset()
      }))
      present(alert, animated: true)
    }
  }

}
