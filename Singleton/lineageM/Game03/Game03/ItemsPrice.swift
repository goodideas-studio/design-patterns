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
    
    private init() { }
    
    var itemNameAndItemPrice: [String: Int] = ["red_potion": 5, "orange_potion": 5, "clear_potion": 5, "atk_potion": 10, "def_potion": 10, "ancient_red_potion": 15, "ancient_orange_potion": 15, "ancient_clear_potion": 15]
}


