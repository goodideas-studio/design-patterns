//
//  SettingsViewTimeViewModel.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/29.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct SettingsViewTimeViewModel: SettingsRepresentable {
  
  let timeNotation: TimeNotation
  
  private enum Accessory: Int {
    case none = 0
    case checkmark = 3
  }
  
  var text: String {
    switch timeNotation {
    case .twelveHour:
      return "12 Hour"
    default:
      return "24 Hour"
    }
  }
  
  var accessoryType: Int {
    if UserDefaults.timeNotation() == timeNotation {
      return Accessory.checkmark.rawValue
    } else {
      return Accessory.none.rawValue
    }
  }
  
}
