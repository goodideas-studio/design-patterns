//
//  Shop.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation

class Shop {
    

    // 商店物品
    var shopItem:[Item] = [
        ItemInfo(itemName: "BigBluePotion", hp: 0, mp: 100, atk: 0, def: 0, dollars: 100),
        ItemInfo(itemName: "BigRedPotion", hp: 100, mp: 0, atk: 0, def: 0, dollars: 100),
        ItemInfo(itemName: "BluePotion", hp: 0, mp: 50, atk: 0, def: 0, dollars: 50),
        ItemInfo(itemName: "RedPotion", hp: 50, mp:0 , atk: 0, def: 0, dollars: 50),
        ItemInfo(itemName: "GreenPotion", hp: 0, mp: 0, atk: 50, def: 50, dollars: 200)
]
    
}


