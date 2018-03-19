//
//  Facade.swift
//  SoJ
//
//  Created by 高菘駿 on 2018/3/19.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

class 炒飯達人 {
    
    var 蛋黃: 蛋黃
    var 蛋白: 蛋白
    var 白米: 白米
    let 一茶匙油: 油
    let 一大湯匙油: 油
    var 蔥: 蔥
    
    init (蛋黃: 蛋黃, 蛋白: 蛋白, 白米: 白米, 蔥: 蔥) {
        self.蛋黃 = 蛋黃
        self.蛋白 = 蛋白
        self.白米 = 白米
        self.一茶匙油 = 油.init(油量: "一茶匙")
        self.一大湯匙油 = 油.init(油量: "一大湯匙")
        self.蔥 = 蔥
        製作炒飯()
    }
    
    func 製作炒飯() {
        let 達人電鍋 = 電鍋(是否開電: true)
        let 達人冰箱 = 冰箱(是否開電: true)
        
        let 達人炒飯鍋 = 炒飯鍋(是否開火: true)

        //備料
        白米.熟了 = 達人電鍋.煮飯(物品: 白米, 烹調時間: "30分鐘")
        
        if 白米.熟了 {
            白米.原料名 = "一碗白飯"
        }
        
        達人冰箱.放入物品(物品: 白米, 冷藏時間: "24小時")
        
        蛋黃.混合(白米: 白米)
        
        //先炒蛋白 + 蔥
        蛋白.炒香了 = 達人炒飯鍋.炒蛋白(蛋白: 蛋白, 油: 一大湯匙油.原料名)
        蔥.炒香了 = 達人炒飯鍋.炒蔥段(蛋白: 蛋白, 蔥: 蔥, 油: 一茶匙油.原料名)
        
        print("")
        print("********************")
        print("       開始炒飯")
        print("********************")
        print("")
        
        //炒飯
        達人炒飯鍋.炒飯(蛋白: 蛋白, 蛋黃: 蛋黃, 油: 一茶匙油.原料名)
        
    }
}
