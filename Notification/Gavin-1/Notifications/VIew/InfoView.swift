//
//  Information.swift
//  Notifications
//
//  Created by PinguMac on 2018/2/12.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class InfoView: UIView {
  lazy var hpValLabel1 = UILabel()
  lazy var hpValLabel2 = UILabel()
  var hpVal1: Int!
  var hpVal2: Int!
  
  weak var delegate: HomeViewDelegate?

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    hpVal1 = 100
    hpVal2 = 100
    
    let hpLabel1 = UILabel(frame: CGRect(x: 0,
                                         y: 20,
                                         width: 50,
                                         height: 50))
    hpLabel1.text = "hp1"
    hpLabel1.textColor = UIColor.red
    hpLabel1.font = UIFont.systemFont(ofSize: 20)
    hpLabel1.textAlignment = .center
    hpLabel1.numberOfLines = 1
    self.addSubview(hpLabel1)
  
    hpValLabel1.frame = CGRect(x: hpLabel1.frame.maxX + 10,
                               y: 20,
                               width: 50,
                               height: 50)
    hpValLabel1.text = String(hpVal1)
    hpValLabel1.textColor = UIColor.red
    hpValLabel1.font = UIFont.systemFont(ofSize: 20)
    hpValLabel1.textAlignment = .center
    hpValLabel1.numberOfLines = 1
    self.addSubview(hpValLabel1)
    
    let hpLabel2 = UILabel(frame: CGRect(x: 0,
                                         y: hpLabel1.frame.maxY + 30,
                                         width: 50,
                                         height: 50))
    hpLabel2.text = "hp2"
    hpLabel2.textColor = UIColor.red
    hpLabel2.font = UIFont.systemFont(ofSize: 20)
    hpLabel2.textAlignment = .center
    hpLabel2.numberOfLines = 1
    self.addSubview(hpLabel2)
  
    hpValLabel2.frame = CGRect(x: hpLabel2.frame.maxX + 10,
                               y: hpValLabel1.frame.maxY + 30,
                               width: 50,
                               height: 50)
    hpValLabel2.text = String(hpVal2)
    hpValLabel2.textColor = UIColor.red
    hpValLabel2.font = UIFont.systemFont(ofSize: 20)
    hpValLabel2.textAlignment = .center
    hpValLabel2.numberOfLines = 1
    self.addSubview(hpValLabel2)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func resetHp() {
    self.hpVal1 = 100
    self.hpVal2 = 100
  }
}
