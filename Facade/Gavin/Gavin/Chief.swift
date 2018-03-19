//
//  Chief.swift
//  Gavin
//
//  Created by PinguMac on 2018/3/19.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

class Chief: FriedRice {
  func getIcedRice(weight: Int) -> Bool {
    let refrigerator = Refrigerator()
    return refrigerator.getRice(weight: weight)
  }
  
  func getFlavored(oilWeight: Int, greenOnionWeight: Int, pepperWeight: Int) -> Bool {
    let oil = Oil(weight: 10)
    let greenOnion = GreenOnion(weight: 10)
    let pepper = Pepper(weight: 3)
    
    guard (oil.weight != nil && greenOnion.weight != nil && pepper.weight != nil) else {
      return false
    }
    return true
  }
  
  func getIngredients(eggNumber: Int) -> Bool {
    let eggYolk = EggYolk(number: eggNumber)
    let eggWhite = EggWhite(number: eggNumber)
    
    guard (eggYolk.number != nil && eggWhite.number != nil) else {
      return false
    }
    return true
  }
  
  let wok = Wok(number: 1)
  let spatula = Spatula(number: 1)
  
  func cookDish(riceWeight: Int, oilWeight: Int, greenOnionWeight: Int, pepperWeight:Int) {
    if getIcedRice(weight: riceWeight) != true {
      print("Out of rice.")
      return
    }
    
    if getFlavored(oilWeight: 10, greenOnionWeight: 10, pepperWeight: 3) != true {
      print("Out of flavored.")
      return
    }
    
    if getIngredients(eggNumber: 10) != true {
      print("Out of egg.")
      return
    }
    
    if wok.number != nil && spatula.number != nil {
      print("Dish cook done.")
    }
  }
  
  func prepareRice(weight: Int) {
    Rice.shared.cookedRice(weight: weight)
  }
}
