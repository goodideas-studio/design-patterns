//
//  SettingsViewTimeViewModel.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/29.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel: SettingsRepresentable {
  
  let timeNotation: TimeNotation
  
  var text: String {
    switch timeNotation {
    case .twelveHour:
      return "12 Hour"
    default:
      return "24 Hour"
    }
  }
  
  var accessoryType: UITableViewCellAccessoryType {
    if UserDefaults.timeNotation() == timeNotation {
      return .checkmark
    } else {
      return .none
    }
  }
  
}
