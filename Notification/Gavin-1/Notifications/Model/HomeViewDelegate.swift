//
//  HomeViewDelegate.swift
//  Notifications
//
//  Created by PinguMac on 2018/2/12.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

protocol HomeViewDelegate: class {
  func updateView1Info(subView1Hp: Int)
  func updateView2Info(subView2Hp: Int)
  func updateView3Info(subView3Hp: Int)
}
