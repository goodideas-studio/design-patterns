//
//  ActControl.swift
//  Game
//
//  Created by PinguMac on 2018/2/8.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation
import UIKit

protocol UpdateCharacterInfo: class {
  func updatePlayerInfo(hpVal: Int, atkVal: Int, name: String)
  func updatePlayerImg(action: Int, image: UIImage)
  
  func updateBossInfo(hpVal: Int, atkVal: Int, name: String)
  func updateBossImg(action: Int, image: UIImage)
}
