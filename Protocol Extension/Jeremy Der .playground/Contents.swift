/*
實作出不太貴又可以搖可以喝的Gin Tonic , 與太貴又不好喝但是可以搖可以點火的 的Martini 。以及不太貴不可以搖又好喝的 Sangria。(note: 每個時做出來的物件必須要有實作方法)

可以試著用 class 或者 protocol 比較兩種不同方式
*/

/*
 規則： if Drinkable, isOverCooked 必須是 false ; if Enjoyable, percentage 必須小於 10 % ; if Affordable, price 必須小於 200.0
 */


//
//  main.swift
//  protocolExtension
//
//  Created by JeremyXue on 2018/3/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation


protocol Shakable {
    var seconds: Int {get set}
    func shake(time: Int)
}
protocol Burnable {
    var withFire: Bool {get}
    func brun()
}
protocol Drinkable {
    var isOverCooked: Bool {get}
    func drink()
}
protocol Enjoyable {
    var percentage: Decimal {get set}
    func canFinish()
}

protocol Affordable {
    var price: Double {get set}
    func canPay()
}

class Drink:Affordable,Shakable,Drinkable,Enjoyable {
    var seconds = 10
    var isOverCooked = false
    var price = 200.0
    var percentage: Decimal = 10.0
    
    func shake(time: Int) {
        if time == 0 {
            print("Stop Shaking.")
        } else {
            print("Shake \(time) seconds.")
        }
    }
    func drink() {
        if isOverCooked == false {
            print("can drink")
        } else {
            print("can't drink")
        }
    }
    func canPay() {
        if price < 200 {
            print("can Pay.")
        } else {
            print("can't Pay.")
        }
    }
    func canFinish() {
        if percentage < 10 {
            print("can finish.")
        } else {
            print("can't finish.")
        }
    }
}

var GinTonic = Drink()
print("========= Gin Tonic ==========")
GinTonic.price = 100
GinTonic.canPay()
GinTonic.shake(time: 10)
GinTonic.drink()


var Sangria = Drink()
print("========= Sangria ==========")
Sangria.price = 100
Sangria.canPay()
Sangria.shake(time: 0)
Sangria.drink()


extension Drink:Burnable {
    var withFire: Bool {
        get {
            return false
        }
    }
    func brun() {
        print("let it burn")
    }
}

var Martini  = Drink()
print("========= Martini ==========")

Martini.price = 250
Martini.canPay()
Martini.shake(time: 10)
Martini.isOverCooked = true
Martini.drink()
Martini.brun()
