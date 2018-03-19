//
//  Ingredients.swift
//  Gavin
//
//  Created by PinguMac on 2018/3/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct EggYolk {
  var weight: Int
  
  init(weight: Int) {
    self.weight = weight
  }

}

struct Oil {
  var weight: Int?
}

struct EggWhite {
  var weight: Int?
}

struct GreenOnion {
  var weight: Int?
}

struct Pepper {
  var weight: Int?
}


final class Rice {
  static let shared = Rice()
  
  var weight: Int
  
  private init() {
    self.weight = 1000
  }
  
  func cookedRice(weight: Int) {
    self.weight += weight
  }
  
  func decrease(money: Int) -> Int {
    totalAsset -= money
    return totalAsset
  }
}
