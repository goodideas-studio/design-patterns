//
//  ViewController.swift
//  Gavin
//
//  Created by PinguMac on 2018/3/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let chief = Chief()
    chief.cookDish(riceWeight: 300, oilWeight: 10, greenOnionWeight: 10, pepperWeight: 10)

    chief.cookDish(riceWeight: 800, oilWeight: 10, greenOnionWeight: 10, pepperWeight: 10)

    chief.prepareRice(weight: 500)

    chief.cookDish(riceWeight: 800, oilWeight: 10, greenOnionWeight: 10, pepperWeight: 10)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

