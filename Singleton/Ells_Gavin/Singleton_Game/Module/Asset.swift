//  Asset.swift
//  Singleton_Game
//
//  Created by PinguMac on 2018/2/26.
//  Copyright © 2018年 唐嘉伶. All rights reserved.

import Foundation

let defaultAsset: Int = 100

final class Asset {
  static let shared = Asset()
  var totalAsset: Int = defaultAsset
  
  private init() {
    print("Asset create.")
  }
  
  func increaseMoney(money: Int) -> Int {
    totalAsset += money
    return totalAsset
  }
  
  func decrease(money: Int) -> Int {
    totalAsset -= money
    return totalAsset
  }
    
}
