//: Playground - noun: a place where people can play

import UIKit

protocol Shakable {
    var seconds: Int {get set}
    func shake(time: Int)
}

extension Shakable{
    func shake(time:Int){
        if time > 0{
            print("The bevarage has been shaken in \(time) seconds")
        }else{
            print("The beverage has not been shaken")
        }
    }
}
protocol Burnable {
    var withFire: Bool {get set}
    func burn()
}

extension Burnable{
    func burn(){
        if withFire{
            print("The bevarage is burnable")
        }else{
            print("The bevarage is unburnable")
        }
    }
}

protocol Drinkable {
    var isOverCooked: Bool {get set}
    func drink()
}

extension Drinkable{
    func drink(){
        if isOverCooked == false{
            print("The bevarage is drinkable")
        }else{
            print("The beverage is not drinkable")
        }
    }
}

protocol Enjoyable {
    var percentage: Decimal {get set}
    func canFinish()
}

extension Enjoyable{
    func canFinish(){
        if percentage < 10.0{
            print("The beverage is enjoyable")
        }else{
            print("The beverage is not enjoyable")
        }
    }
}

protocol Affordable {
    var price: Double {get set}
    func canPay()
}

extension Affordable{
    func canPay(){
        if price < 200{
            print("The bevarage is affordable")
        }else{
            print("The bevarage is not affordable")
        }
    }
}

class GinTonic: Affordable, Shakable, Drinkable, Burnable{
    
    var price: Double
    var seconds: Int
    var withFire: Bool
    var isOverCooked: Bool
    init(price:Double, seconds:Int, withFire:Bool,isOverCooked:Bool) {
        self.price = price
        self.seconds = seconds
        self.withFire = withFire
        self.isOverCooked = isOverCooked
    }
}

let ginTonic = GinTonic(price: 100, seconds: 10, withFire: false, isOverCooked: false)
ginTonic.canPay()
ginTonic.shake(time: 10)
ginTonic.burn()
ginTonic.drink()


class Martini: Affordable, Shakable, Drinkable, Burnable{
    
    var price: Double
    var seconds: Int
    var withFire: Bool
    var isOverCooked: Bool
    init(price:Double, seconds:Int, withFire:Bool,isOverCooked:Bool) {
        self.price = price
        self.seconds = seconds
        self.withFire = withFire
        self.isOverCooked = isOverCooked
    }
}

let martini = Martini(price: 300, seconds: 10, withFire: true, isOverCooked: true)
martini.canPay()
martini.shake(time: 5)
martini.burn()
martini.drink()


class Sangria: Affordable, Shakable, Drinkable, Burnable{
    
    var price: Double
    var seconds: Int
    var withFire: Bool
    var isOverCooked: Bool
    init(price:Double, seconds:Int, withFire:Bool,isOverCooked:Bool) {
        self.price = price
        self.seconds = seconds
        self.withFire = withFire
        self.isOverCooked = isOverCooked
    }
}

let sangria = Sangria(price: 100, seconds: 0, withFire: false, isOverCooked: false)
sangria.canPay()
sangria.shake(time: 0)
sangria.burn()
sangria.drink()
