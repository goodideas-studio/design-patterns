//
//  Ingredients.swift
//  Gavin
//
//  Created by PinguMac on 2018/3/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

protocol Flavor {
  var weight: Int? { get }
}

struct Oil: Flavor {
  var weight: Int?
  
  init(weight: Int) {
    self.weight = weight
  }
}

struct GreenOnion: Flavor {
  var weight: Int?
  
  init(weight: Int) {
    self.weight = weight
  }
}

struct Pepper: Flavor {
  var weight: Int?
  
  init(weight: Int) {
    self.weight = weight
  }
}
