//
//  FriedRice.swift
//  Gavin
//
//  Created by PinguMac on 2018/3/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

protocol FriedRice {
  func getIcedRice(weight: Int) -> Bool
  
  func getIngredients(eggNumber: Int) -> Bool
  
  func getFlavored(oilWeight: Int, greenOnionWeight: Int, pepperWeight: Int) -> Bool 
}
