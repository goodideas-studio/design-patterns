//
//  SettingsViewTemperatureViewModel.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/4/1.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import AVFoundation

struct SettingsViewTemperatureViewModel: SettingsRepresentable {
  
  // MARK: - Properties
  var temperatureNotation: TemperatureNotation
  
  // MARK: - Public Interface
  var text: String {
    switch temperatureNotation {
    case .fahrenheit:
      return "Fahrenheit"
    default:
      return "Celsius"
    }
  }
  
  var accessoryType: Accessory {
    if UserDefaults.temperatureNotation() == temperatureNotation {
      return .checkmark
    } else {
      return .none
    }
  }
  
}
