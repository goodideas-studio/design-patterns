//
//  FirstViewController.swift
//  Singleton_Game
//
//  Created by 唐嘉伶 on 26/02/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

  @IBOutlet weak var totalAssetLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Initial all view controller in tab bar controller
    for viewController in (self.tabBarController?.viewControllers)! {
      _ = viewController.view
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func giveMeMoney(_ sender: UIButton) {
    let tempValue = Int(totalAssetLabel.text!)
    totalAssetLabel.text = String(tempValue! + 5)
    NotificationCenter.default.post(name: .moneyDidSelect, object: totalAssetLabel.text)
  }
}

