//
//  PowerUps.swift
//  Singleton_Game
//
//  Created by PinguMac on 2018/2/26.
//  Copyright © 2018年 唐嘉伶. All rights reserved.
//

import UIKit

struct PowerUps {
  var potionImg: UIImage
  var attribute: String
  var powerValue: Int
  var price: Int
  
  init(potionImg: UIImage, attribute: String, powerValue: Int, price: Int) {
    self.potionImg = potionImg
    self.attribute = attribute
    self.powerValue = powerValue
    self.price = price
  }
}

let packItem1 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Attack", powerValue: 5, price: 5)
let packItem2 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Defence", powerValue: 5, price: 5)
let packItem3 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "HP", powerValue: 5, price: 5)
let packItem4 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "MP", powerValue: 5, price: 5)
let packItem5 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Defence", powerValue: 5, price: 5)
let packItem6 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "HP", powerValue: 5, price: 5)
let packItem7 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Attack", powerValue: 5, price: 5)
let packItem8 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Defence", powerValue: 5, price: 5)
let packItem9 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Attack", powerValue: 5, price: 5)

let itemInPack = [packItem1, packItem2, packItem3, packItem4,
                  packItem5, packItem6, packItem7, packItem8,
                  packItem9]

let shopItem1 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Attack", powerValue: 5, price: 5)
let shopItem2 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Defence", powerValue: 5, price: 5)
let shopItem3 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "HP", powerValue: 5, price: 5)
let shopItem4 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "MP", powerValue: 5, price: 5)
let shopItem5 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Defence", powerValue: 5, price: 5)
let shopItem6 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "HP", powerValue: 5, price: 5)
let shopItem7 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Attack", powerValue: 5, price: 5)
let shopItem8 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Defence", powerValue: 5, price: 5)
let shopItem9 = PowerUps(potionImg: UIImage(named: "Attack_Potion")!,
                         attribute: "Attack", powerValue: 5, price: 5)

let itemInShop = [shopItem1, shopItem2, shopItem3, shopItem4,
                  shopItem5, shopItem6, shopItem7, shopItem8,
                  shopItem9]
