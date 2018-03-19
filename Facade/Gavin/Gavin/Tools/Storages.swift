//
//  Storages.swift
//  Gavin
//
//  Created by PinguMac on 2018/3/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class Refrigerator {
  
  public func getRice(weight: Int) -> Bool {
    if weight > Rice.shared.weight {
      return false
    } else {
      Rice.shared.sell(weight: weight)
      return true
    }
  }
  
}
