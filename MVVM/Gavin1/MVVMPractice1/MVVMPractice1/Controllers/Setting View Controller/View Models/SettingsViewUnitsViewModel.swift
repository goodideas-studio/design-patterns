//
//  SettingsViewUnitsViewModel.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/4/1.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

struct SettingsViewUnitsViewModel: SettingsRepresentable {

  // MARK: - Properties
  let unitsNotation: UnitsNotation
  
  private enum Accessory: Int {
    case none = 0
    case checkmark = 3
  }

  // MARK: - Public Interface
  var text: String {
    switch unitsNotation {
    case .imperial:
      return "Imperial"
    case .metric:
      return "Metric"
    }
  }

  var accessoryType: Int {
    if UserDefaults.unitsNotation() == unitsNotation {
      return Accessory.checkmark.rawValue
    } else {
      return Accessory.none.rawValue
    }
  }

}
