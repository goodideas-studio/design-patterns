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

  // MARK: - Public Interface
  var text: String {
    switch unitsNotation {
    case .imperial:
      return "Imperial"
    case .metric:
      return "Metric"
    }
  }

  var accessoryType: Accessory {
    if UserDefaults.unitsNotation() == unitsNotation {
      return .checkmark
    } else {
      return .none
    }
  }

}
