//
//  ItemInfo.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation

struct ItemInfo {
    
    var itemName:String = ""
    var hp:Int = 0
    var mp:Int = 0
    
    var atk = 0
    var def = 0
    
    var dollars = 0
    
    init (itemName:String,hp:Int,mp:Int,atk:Int,def:Int,dollars:Int){
        self.itemName = itemName
        self.hp = hp
        self.mp = mp
        
        self.atk = atk
        self.def = def
        
        self.dollars = dollars
    }
    
}

// 創建實例
var bigBluePostion = ItemInfo(itemName: "BigBluePostion", hp: 0, mp: 50, atk: 0, def: 0, dollars: 50)
var bigRedPostion = ItemInfo(itemName: "BigBluePostion", hp: 50, mp: 00, atk: 0, def: 0, dollars: 50)
var GreenPostion = ItemInfo(itemName: "BigBluePostion", hp: 0, mp: 0, atk: 100, def: 100, dollars: 200)
var bluePostion = ItemInfo(itemName: "BigBluePostion", hp: 0, mp: 10, atk: 0, def: 0, dollars: 10)
var redPostion = ItemInfo(itemName: "BigBluePostion", hp: 10, mp: 0, atk: 0, def: 0, dollars: 10)
