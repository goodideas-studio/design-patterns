//
//  subViewController2.swift
//  Notifications
//
//  Created by PinguMac on 2018/2/12.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation
import UIKit

class subViewController2: UIViewController {
  
  init() {
    super.init(nibName: nil, bundle: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(startGameNotify),
                                           name: .startDidSelect,
                                           object: nil)
  
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(resetGameNotify),
                                           name: .resetDidSelect,
                                           object: nil)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  let infoView = InfoView()
  weak var delegate: HomeViewDelegate?
  var isGameStart: Bool = false
  var timer = Timer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.green
    self.view.addSubview(infoView)
  }
  
  @IBAction func startGameNotify() {
    if !isGameStart {
      isGameStart = true
      timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true, block: { (timer) in
        self.infoView.hpVal1? -= 1
        if self.infoView.hpVal1 == 0 {
          self.isGameStart = false
        }
        self.infoView.hpValLabel1.text = String(self.infoView.hpVal1)
        self.updateSubView2Info()
      })
    }
  }
  
  @IBAction func resetGameNotify() {
    isGameStart = false
    timer.invalidate()
    infoView.resetHp()
    infoView.hpValLabel1.text = String(infoView.hpVal1)
    
    updateSubView2Info()
  }
  
  func updateSubView2Info() {
    delegate?.updateHomeViewInfo(subViewNum: 2, hpVal1: infoView.hpVal1)
  }
}
