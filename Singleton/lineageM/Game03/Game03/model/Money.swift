//
//  money.swift
//  Game03
//
//  Created by 高菘駿 on 2018/2/26.
//  Copyright © 2018年 SoJ. All rights reserved.
//
import Foundation

class Money {
    static let current = Money()
    var moneyNumber: Int = 0

    private init() { }

    func earnFiveMoney () {
        moneyNumber += 5
    }
}





