//
//  SettingsRepresentable.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/29.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

enum Accessory: Int {
  case none = 0
  case checkmark = 3
}

protocol SettingsRepresentable {
  var text: String { get }
  var accessoryType: Accessory { get }
}
