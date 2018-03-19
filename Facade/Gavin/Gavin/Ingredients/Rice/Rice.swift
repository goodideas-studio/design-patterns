//
//  Rice.swift
//  Gavin
//
//  Created by PinguMac on 2018/3/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

final class Rice {
  static let shared = Rice()
  
  var weight: Int
  
  private init() {
    self.weight = 1000
  }
  
  func cookedRice(weight: Int) {
    let electricPot = ElectricPot()
    let newRice = electricPot.cookRice(weight: weight)
    
    self.weight += newRice
  }
  
  func sell(weight: Int) {
    self.weight -= weight
  }
}
