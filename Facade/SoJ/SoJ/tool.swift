//
//  Tool.swift
//  SoJ
//
//  Created by 高菘駿 on 2018/3/19.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

//鍋具
class  電鍋 {
    
    var 是否開電: Bool
//    var 烹調時間: Int
    
    init(是否開電: Bool) {
        self.是否開電 = 是否開電
    }
    
    func 煮飯(物品: 白米, 烹調時間: String) -> Bool {
        print(".")
        print(".")
        print(".")
        print("經過\(烹調時間)後")
        print("======================")
        print("\(物品.原料名)煮熟了")
        print("")
        print("")
        return true
    }
    
}

class  冰箱 {
    
    var 是否開電: Bool
//    var 冷藏物品: [String]
//    var 冷藏時間: Int
    
    
    init(是否開電: Bool) {
        self.是否開電 = 是否開電
    }
    
    func 放入物品(物品: 白米, 冷藏時間: String) {

        print("\(物品.原料名)放入冰箱")
        print(".")
        print(".")
        print(".")
        print("經過\(冷藏時間)後")
        print("======================")
        print("獲得冷藏\(冷藏時間)後的\(物品.原料名)")
        print("")
        print("")
        
    }
}


class  炒飯鍋 {
    
    var 是否開火: Bool = false
    //var 時間: Int = 0
//    var 翻鍋次數: Int
    let 炒飯鍋鏟 = 鍋鏟()
    let 炒蛋鍋鏟 = 鍋鏟()
    let 炒蔥鍋鏟 = 鍋鏟()
    
    
    func 炒飯(蛋白: 蛋白, 蛋黃: 蛋黃, 油: String) {
        
        
        if 是否開火 && 蛋白.炒香了 && 蛋黃.混合物 == "一碗混合了蛋黃的飯" && 油 == "一茶匙的油" {
            print("放入\(蛋黃.混合物)")
            print("")
            
            repeat {
                炒飯鍋鏟.翻炒()
            } while  炒飯鍋鏟.翻炒次數 < 6
            
                print(".")
                print(".")
                print(".")
                    print("經過 7749 秒後...")
                    print("!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    print("炒飯完成了!!")

        } else if !是否開火 {
            print("還沒開火")
        } else if 蛋白.炒香了 {
            print("蛋白跟蔥段還沒炒啊!!")
        } else if 蛋黃.原料名 == "一碗混和了蛋黃的生米" {
            print("米不先煮過，有點硬啊!!")
        }
        
    }
    
    func 炒蛋白(蛋白: 蛋白, 油: String) -> Bool {
        
        if 是否開火 && 油 == "一大湯匙的油" {
            
            print("放入\(蛋白.原料名)")
            print("")
            
            repeat {
                    self.炒蛋鍋鏟.翻炒()
            } while 炒蛋鍋鏟.翻炒次數 < 4
        
            print("蛋白炒香了")
            print("")
            print("==========")
            return true
    
        } else {
            print("要先開火啊!")
            return false
        }
        
    }
    
    func 炒蔥段(蛋白: 蛋白, 蔥: 蔥, 油: String) -> Bool {
        
        if 是否開火 && 蛋白.炒香了 && 油 == "一茶匙的油" {
            
            print("放入\(蔥.切段)")
            print("")
            
            
            repeat {
            
                    self.炒蔥鍋鏟.翻炒()

            } while 炒蔥鍋鏟.翻炒次數 < 4
            
            print("蛋白跟蔥段一起炒香了")
            print("")
            print("==========")
            return true
            
        } else {
            print("要先開火啊!")
            return false
        }
        
    }
    
    init (是否開火: Bool) {
        self.是否開火 = 是否開火
    }
}

class  鍋鏟 {
    
    var 翻炒次數: Int
    
    func 翻炒() {
        翻炒次數 += 1
        print("用鍋鏟翻炒了\(翻炒次數)次")
    }
    
    init () {
        self.翻炒次數 = 0
    }

}
