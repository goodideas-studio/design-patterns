//
//  ViewController.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/29.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

  @IBOutlet weak var userName: BoundTextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let user = User(name: Observable("Paul Hudson"))

    userName.bind(to: user.name)
  
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func unwindToRootViewController(segue: UIStoryboardSegue) {
    
  }

}

