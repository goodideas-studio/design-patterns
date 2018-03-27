
/*
 實作出
 
 不太貴 可以搖 可以喝 的 GinTonic
 太貴 可以搖 不好喝 Martini
 不太貴 不可遙 好喝 Sangria
 
 if Drinkable, isOverCooked 必須是 false ;
 if Enjoyable, percentage 必須小於 10 % ;
 if Affordable, price  必須小於 200.0
 */

import Foundation

protocol Shakable {
    var second : Int { get set }
    func shake()
}

protocol Burnable {
    var withFire : Bool { get }
    func burn()
}

protocol Drinkable {
    var isOverCooked : Bool { get }
    func drink()
}

protocol Enjoyable {
    var percentage : Decimal { get set }
    func canFinish()
}

protocol Afforable {
    var price : Double { get set }
    func canPay()
}

protocol Drink: Shakable, Burnable, Drinkable, Enjoyable, Afforable {
    
}

extension Shakable {
    func shake() {
    if second < 0 {
        print(" Dont shake , plz")
    }else {
        print("shake \(second) for good taste")
    }
  }
}

extension Burnable {
    func burn() {
//        if withFire == true {
//            print("Fire Fire")
//        }else {
//            print("Watchout body!! ")
//        }
    withFire ? print("Fire Fire"):print("Watchout body!! ")
    }

}

extension Drinkable {
    func drink(){
       if  isOverCooked == false {
        print("Good to drink")
       }else {
        print("I don't like it")
    }
    
  }
}


extension Enjoyable {
    func canFinish(){
        if percentage < 10 {
            print("cheers")
        }else {
            print("I am drunk")
        }
    }
}

extension Afforable {
    func canPay(){
        if price < 200 {
            print("I need anoth drink")
        }else {
            print("too expensive")
        }
    }
}



class GinTonic : Drink {
    var second: Int
    var withFire: Bool
    var isOverCooked: Bool
    var percentage: Decimal
    var price: Double
    init(second:Int, withFire:Bool, isOverCooked:Bool, percentage:Decimal, price:Double){
        self.second = second
        self.withFire = withFire
        self.isOverCooked = isOverCooked
        self.percentage = percentage
        self.price = price
    }
}

class Martini : Drink {
    var second: Int
    var withFire: Bool
    var isOverCooked: Bool
    var percentage: Decimal
    var price: Double
    init(second:Int, withFire:Bool, isOverCooked:Bool, percentage:Decimal, price:Double){
        self.second = second
        self.withFire = withFire
        self.isOverCooked = isOverCooked
        self.percentage = percentage
        self.price = price
    }
}

class Sangria : Drink {
    var second: Int
    var withFire: Bool
    var isOverCooked: Bool
    var percentage: Decimal
    var price: Double
    init(second:Int, withFire:Bool, isOverCooked:Bool, percentage:Decimal, price:Double){
        self.second = second
        self.withFire = withFire
        self.isOverCooked = isOverCooked
        self.percentage = percentage
        self.price = price
    }
}


let ginTonic = GinTonic(second: 15, withFire: false, isOverCooked: false, percentage: 3, price: 99)

ginTonic.burn()
ginTonic.canFinish()
ginTonic.canPay()
ginTonic.drink()
ginTonic.shake()
