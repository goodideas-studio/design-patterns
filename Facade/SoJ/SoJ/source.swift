//
//  source.swift
//  SoJ
//
//  Created by 高菘駿 on 2018/3/19.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

//原料
struct 蛋黃 {
    
    var 原料名 = "一顆蛋黃"
    var 混合物: String = ""
    
    mutating func 混合(白米: 白米) {
        
        if 白米.熟了 {
            混合物 = "一碗混合了蛋黃的飯"
        } else {
            混合物 = "一碗混和了蛋黃的生米"
        }
    }

}

struct 白米 {
    
    var 原料名 = "一碗白米"
    var 熟了:  Bool = false
    var 溫度: Int = 25
    
}

struct 油 {
    
    var 原料名: String
    let 油量: String
    
    init (油量: String) {
        self.原料名 = 油量 + "的油"
        self.油量 = 油量
    }
}

struct 蛋白 {
    
    let 原料名 = "蛋白"
    var 炒香了: Bool = false
    
}

struct 蔥 {
    
    let 切段 = "蔥段"
    var 炒香了:  Bool = false
    
}


