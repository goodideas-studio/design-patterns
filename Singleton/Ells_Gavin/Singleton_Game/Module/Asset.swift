//
//  Asset.swift
//  Singleton_Game
//
//  Created by PinguMac on 2018/2/26.
//  Copyright © 2018年 唐嘉伶. All rights reserved.
//

import Foundation

let defaultAsset: Int = 1000

final class Asset {
  static let shared = Asset()
  var totalAsset: Int = defaultAsset
  
  private init() {
    print("Asset create.")
  }
  
  func increaseMoney(Money: Int) -> Int {
    totalAsset += Money
    return totalAsset
  }
}
