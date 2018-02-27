//
//  FirstViewController.swift
//  Singleton_Game
//
//  Created by 唐嘉伶 on 26/02/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

enum ItemAttribute: String {
  case Attack = "Attack"
  case Defence = "Defence"
  case MP = "MP"
}

class MainViewController: UIViewController {

  @IBOutlet weak var totalAssetLabel: UILabel!
  @IBOutlet weak var hpVal: UILabel!
  @IBOutlet weak var atkVal: UILabel!
  @IBOutlet weak var mpVal: UILabel!
  @IBOutlet weak var defVal: UILabel!
  
  var character = Character(ATK: 100, DEF: 100, HP: 100, MP: 100)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let packVC = tabBarController?.viewControllers![1] as! PackViewController
    packVC.delegate = self
    
    // Initial all view controller in tab bar controller
    for viewController in (self.tabBarController?.viewControllers)! {
      _ = viewController.view
    }
    
    totalAssetLabel.text = String(Asset.shared.totalAsset)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func giveMeMoney(_ sender: UIButton) {
    totalAssetLabel.text = String(Asset.shared.increaseMoney(Money: 5))
  }
}

extension MainViewController: PackViewControllerDelegate {
  func characterInfoUpdate(packItem: PowerUps) {
    switch packItem.attribute {
    case ItemAttribute.Attack.rawValue:
      character.ATK += packItem.powerValue
      atkVal.text = String(character.ATK)
    default:
      break
    }
  }
}

