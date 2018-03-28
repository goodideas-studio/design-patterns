/*實作出不太貴又可以搖可以喝的Gin Tonic ,
 與太貴又不好喝但是可以搖可以點火的 的Martini 。
 以及不太貴不可以搖又好喝的 Sangria。
 (note: 每個實做出來的物件必須要有實作方法)
 */

import Foundation


protocol Shakable {
    var shakeSeconds: Int {get}
    func shake()
}
extension Shakable{
    func shake(){
        print("shake it \(shakeSeconds) seconds,")
    }
}
protocol Burnable {
    var withFire: Bool {get}
    func burn()
}
extension Burnable{
    func burn(){
        if withFire == true{
            print("drink with fire")
        }else{
            print("drink without fire")
        }
    }
}

protocol Drinkable {
    var isOverCooked: Bool {get}
    func drink()
}
extension Drinkable{
    func drink(){
        if isOverCooked == true{
            print("taste not good!")
        }else{
            print("taste awesome!")
        }
    }
}
protocol Enjoyable {
    var enjoyPercentage: Decimal {get}
    func enjoyIt()
}

extension Enjoyable{
    func enjoyIt(){
        if enjoyPercentage < 10 {
        print("I love this!")
        }else{
        print("Too strong, not for me!")
        }

    }
}
protocol Affordable {
    var priceAffordable: Double {get}
    func canPay()
}

extension Affordable{
    func canPay(){
        if priceAffordable < 200{
            print("price $ \(priceAffordable) is affordable")
        }else{
            print("price $ \(priceAffordable) isn't affordable)")
        }
        
    }
}

protocol Drink:Shakable,Enjoyable,Drinkable,Burnable,Affordable{
    
}

class GinTonic:Drink{

    var shakeSeconds: Int
    var isOverCooked: Bool
    var priceAffordable: Double
    var enjoyPercentage: Decimal
    var withFire: Bool

    init(gintonicShakeSecond:Int,gintonicOverCooked:Bool,gintonicPriceAffordable:Double,gintonicEnjoyPrecentage:Decimal,gintonicWithFire:Bool){
        self.shakeSeconds = gintonicShakeSecond
        self.isOverCooked = gintonicOverCooked
        self.priceAffordable = gintonicPriceAffordable
        self.enjoyPercentage = gintonicEnjoyPrecentage
        self.withFire = gintonicWithFire
    }
}
let finishGinTonic = GinTonic(gintonicShakeSecond: 5, gintonicOverCooked: false, gintonicPriceAffordable: 100, gintonicEnjoyPrecentage: 9, gintonicWithFire: false)
print(".....GINTONIC....")
finishGinTonic.shake()
finishGinTonic.drink()
finishGinTonic.canPay()
finishGinTonic.enjoyIt()
finishGinTonic.burn()
class Martini:Drink{

    var priceAffordable: Double
    var isOverCooked: Bool
    var shakeSeconds: Int
    var withFire: Bool
    var enjoyPercentage: Decimal
    init(martiniPriceAffordable:Double,martiniIsOverCooked:Bool,martiniShakeSeconds:Int,martiniWithFire:Bool,martiniEnjoy:Decimal){
        self.priceAffordable = martiniPriceAffordable
        self.isOverCooked = martiniIsOverCooked
        self.shakeSeconds = martiniShakeSeconds
        self.withFire = martiniWithFire
        self.enjoyPercentage = martiniEnjoy
    }
}

let finishMartini = Martini(martiniPriceAffordable: 250, martiniIsOverCooked: true, martiniShakeSeconds: 10, martiniWithFire: true, martiniEnjoy: 50)
print(".....MARTINI....")
finishMartini.canPay()
finishMartini.enjoyIt()
finishMartini.shake()
finishMartini.burn()
finishMartini.drink()

class Sangria:Drink{
    var priceAffordable: Double
    var isOverCooked: Bool
    var shakeSeconds: Int
    var withFire: Bool
    var enjoyPercentage: Decimal
    init(sangriaPriceAffordable:Double,sangriaIsOverCooked:Bool,sangriaShakeSeconds:Int,sangriaWithFire:Bool,sangriaEnjoy:Decimal){
        self.priceAffordable = sangriaPriceAffordable
        self.isOverCooked = sangriaIsOverCooked
        self.shakeSeconds = sangriaShakeSeconds
        self.withFire = sangriaWithFire
        self.enjoyPercentage = sangriaEnjoy
    }
}

let finishSangria = Sangria(sangriaPriceAffordable: 20, sangriaIsOverCooked: false, sangriaShakeSeconds: 0, sangriaWithFire: false, sangriaEnjoy: 5)
print(".....Sangria....")
finishSangria.canPay()
finishSangria.enjoyIt()
finishSangria.shake()
finishSangria.burn()
finishSangria.drink()


