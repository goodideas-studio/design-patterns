//
//  ItemInfo.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation


protocol Item {
    var itemName:String {get}
    var hp:Int {get}
    var mp:Int {get}
    var atk:Int {get}
    var def:Int {get}
    var dollars:Int {get}
    
}

struct ItemInfo:Item {
    
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








