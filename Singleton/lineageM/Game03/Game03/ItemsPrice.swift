//
//  ItemsPrice.swift
//  Game03
//
//  Created by Peichun on 2018/2/27.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

class ItemsPrice {
    static let shared = ItemsPrice()
    
    var itemPrice = 0
    
    private init() { }
    
//    var red_Potion = 20
//    var orange_potion = 25
//    var clear_potion = 30
//    var atk_potion = 45
//    var def_potion = 45
//    var ancient_red_potion = 40
//    var ancient_orange_potion = 45
//    var ancient_clear_potion = 50
//    
    var red_Potion = 5
    var orange_potion = 5
    var clear_potion = 5
    var atk_potion = 10
    var def_potion = 10
    var ancient_red_potion = 15
    var ancient_orange_potion = 15
    var ancient_clear_potion = 15
}


