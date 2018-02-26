//
//  ViewController.swift
//  Notifications
//
//  Created by PinguMac on 2018/2/12.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
  
  var infoView1: InfoView!
  var infoView2: InfoView!
  var infoView3: InfoView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.white
    
    infoView1 = InfoView(frame: CGRect(x: 0,
                                       y: 0,
                                       width: self.view.frame.width,
                                       height: self.view.frame.height / 4))
    self.view.addSubview(infoView1)
    
    infoView2 = InfoView(frame: CGRect(x: 0,
                                       y: infoView1.frame.maxY,
                                       width: self.view.frame.width,
                                       height: self.view.frame.height / 4))
    self.view.addSubview(infoView2)
    
    infoView3 = InfoView(frame: CGRect(x: 0,
                                       y: infoView2.frame.maxY,
                                       width: self.view.frame.width,
                                       height: self.view.frame.height / 4))
    self.view.addSubview(infoView3)
    
    let startBtn = UIButton(frame: CGRect(x: 30,
                                          y: infoView3.frame.maxY + 10,
                                          width: 120,
                                          height: 40))
    startBtn.setTitle("Start", for: .normal)
    startBtn.backgroundColor = UIColor.blue
    startBtn.addTarget(self, action: #selector(self.startBtn), for: .touchUpInside)
    self.view.addSubview(startBtn)
    
    let resetBtn = UIButton(frame: CGRect(x: startBtn.frame.maxX + 100,
                                          y: infoView3.frame.maxY + 10,
                                          width: 120,
                                          height: 40))
    resetBtn.setTitle("Reset", for: .normal)
    resetBtn.backgroundColor = UIColor.blue
    resetBtn.addTarget(self, action: #selector(self.resetBtn), for: .touchUpInside)
    self.view.addSubview(resetBtn)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func startBtn() {
    NotificationCenter.default.post(name: .startDidSelect, object: nil)
  }

  @IBAction func resetBtn() {
    NotificationCenter.default.post(name: .resetDidSelect, object: nil)
  }
}

extension ViewController: HomeViewDelegate {
  func updateHomeViewInfo(subViewNum: Int, hpVal1: Int) {
    switch subViewNum {
    case 1:
      infoView1.hpValLabel1.text = String(hpVal1)
    case 2:
      infoView2.hpValLabel1.text = String(hpVal1)
    case 3:
      infoView3.hpValLabel1.text = String(hpVal1)
    default:
      break
    }
  }
}

extension Notification.Name {
  static let startDidSelect = Notification.Name("StartDidSelect")
  static let resetDidSelect = Notification.Name("resetDidSelect")
}
