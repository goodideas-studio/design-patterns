//: Playground - noun: a place where people can play

import UIKit
/*
實作出不太貴又可以搖可以喝的Gin Tonic ,
與太貴又不好喝但是可以搖可以點火的 Martini 。
以及不太貴不可以搖又好喝的 Sangria。
 */

//rule:
//if Drinkable, isOverCooked 必須是 false ;
//if Enjoyable, percentage 必須小於 10 % ;
//if Affordable, price 必須小於 200.0

//先用class實作個酒精飲料
//實作出不太貴又可以搖可以喝的Gin Tonic
class GinTonic{
    
    var price: Decimal = 100
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var seconds: Int = 1
    
    func shake() -> Bool {
        return seconds > 0
    }
    
    var isOverCooked: Bool = false
    
    func drink() {
        print("好喝")
    }
    
}

//與太貴又不好喝但是可以搖可以點火的 Martini
class Martini {
    
    var price: Decimal = 300
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var percentage: Decimal = 30
    
    func canFinish() -> Bool {
        return percentage < 10
    }
    
    var seconds: Int = 10
    
    func shake() -> Bool {
        return seconds > 0
    }
    
}

//以及不太貴不可以搖又好喝的 Sangria。

class Sangria {
    
    var price: Decimal = 150
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var seconds: Int = 0
    
    func shake(time: Int) -> Bool {
        return seconds > 0
    }
    
    var percentage: Decimal = 5
    
    func canFinish() -> Bool {
        return percentage < 10
    }
}

/*
 用class實作出來不算太難，但是在管控上就顯得很困難！！
 有些實作內容其實是重複的，應該寫成一包管控，這樣之後在維護上也會比較輕鬆，未來要新增新的飲品也才不會 "少調用" 或 "調用錯方法"
 */


//改用 prtocol 來管控實作的方法與屬性

protocol Shakable {
    var seconds: Int {get}
    func shake() -> Bool
}
protocol Burnable {
    var withFire: Bool {get}
    func burn() -> Bool
}
protocol Drinkable {
    var isOverCooked: Bool {get}
    func drink()
}
protocol Enjoyable {
    var percentage: Decimal {get}
    func canFinish() -> Bool
}

protocol Affordable {
    var price: Double {get}
    func canPay() -> Bool
}

//實作出不太貴又可以搖可以喝的Gin Tonic
class NewGinTonic: Drinkable, Affordable, Shakable {
    
    var isOverCooked: Bool = false
    
    func drink() {
        print("好喝")
    }
    
    var price: Double = 100
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var seconds: Int = 1
    
    func shake() -> Bool {
        return seconds > 0
    }
    
}

//與太貴又不好喝但是可以搖可以點火的 Martini
class NewMartini: Enjoyable, Shakable, Affordable, Burnable {
    var percentage: Decimal = 30
    
    func canFinish() -> Bool {
        return percentage < 10
    }
    
    var seconds: Int = 10
    
    func shake() -> Bool {
        return seconds > 0
    }
    
    var price: Double = 300
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var withFire: Bool = true
    
    func burn() -> Bool {
        return withFire
    }
    
}

//以及不太貴不可以搖又好喝的 Sangria。
class NewSangria: Affordable, Enjoyable, Shakable {
    
    var price: Double = 150
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var percentage: Decimal = 5
    
    func canFinish() -> Bool {
        return percentage < 10
    }
    
    var seconds: Int = 0
    
    func shake() -> Bool {
        return seconds > 0
    }

}

/*
 上面的做法確實是用到了 protocol，但是這也只是確保你的調用不會漏寫該遵守的協議裡面的屬性or方法，裡面的實作方法還是要一一定義，這在管理上還是不盡完美。
 除此之外，飲品遵守的協議也不盡相同，在語法上不夠直覺！
 舉例來說：
 GinTonic 沒有遵守 Enjoyable，如果日後工程師在繼承這個 class 後，將無法調用 canFinish() 的方法，這有違飲品的通用性，所以我們先讓 Drink 遵守所有飲品協議，並讓新的 class 直接遵守 Drink 協議，可有效改善這個問題

*/

protocol Drink: Drinkable, Affordable, Enjoyable, Burnable, Shakable {}

//實作出不太貴又可以搖可以喝的Gin Tonic
class NextGinTonic: Drink {
    var isOverCooked: Bool = false
    
    func drink() {
        print("好喝")
    }
    
    var price: Double = 100
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var percentage: Decimal = 5
    
    func canFinish() -> Bool {
        return percentage < 10
    }
    
    var withFire: Bool = false
    
    func burn() -> Bool {
        return withFire
    }
    
    var seconds: Int = 1
    
    func shake() -> Bool {
        return seconds > 0
    }

}

//與太貴又不好喝但是可以搖可以點火的 Martini
class NextMartini: Drink {
    
    var isOverCooked: Bool = false
    
    func drink() {
        print("好喝")
    }
    
    var price: Double = 300
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var percentage: Decimal = 30
    
    func canFinish() -> Bool {
        return percentage < 10
    }
    
    var withFire: Bool = true
    
    func burn() -> Bool {
        return withFire
    }
    
    var seconds: Int = 30
    
    func shake() -> Bool {
        return seconds > 0
    }
    
}

//以及不太貴不可以搖又好喝的 Sangria。
class NextSangria: Drink {
    
    var isOverCooked: Bool = false
    
    func drink() {
        print("好喝")
    }
    
    var price: Double = 150
    
    func canPay() -> Bool {
        return price < 200
    }
    
    var percentage: Decimal = 5
    
    func canFinish() -> Bool {
        return percentage < 10
    }
    
    var withFire: Bool = false
    
    func burn() -> Bool {
        return withFire
    }
    
    var seconds: Int = 0
    
    func shake() -> Bool {
        return seconds > 0
    }
    
}

/*
 從上面的例子可以看到，除了屬性有變之外，我們的方法是固定的
 每次都要重新定義實作的內容！萬一還要修改實作方法...就可想而知有多煩人
 舉例來說：
 同樣都有 shack() 的方法，我原本是寫小於10秒才是 "可搖晃"
 但是後來實際查了GinTonic的做法，他是慢慢調和的並不需要特別搖晃。
 所以我要變更 shack() 的實作方法，為求統一，我三個飲料都要修改實作方法，這工程有點浩大啊!
 
 
 為了簡化程式碼，我們直接定義好方法的實作內容，這時候就要用 protocol extension
 */

extension Drink {
    
    func drink() {
        print("好喝")
    }
    
    func canPay() -> Bool {
        return price < 200
    }
    
    func canFinish() -> Bool {
        return percentage < 10
    }
    
    func burn() -> Bool {
        return withFire
    }
    
    func shake() -> Bool {
        return seconds > 0
    }
}

class FinalGinTonic: Drink {
    
    var isOverCooked: Bool = false
    
    var price: Double = 100
    
    var percentage: Decimal = 5
    
    var withFire: Bool = false
    
    var seconds: Int = 1
}

class FinalMartini: Drink {
    var isOverCooked: Bool = false
    
    var price: Double = 300
    
    var percentage: Decimal = 30
    
    var withFire: Bool = true
    
    var seconds: Int = 30
}

class FinalSangria: Drink {
    var isOverCooked: Bool = false
    
    var price: Double = 150
    
    var percentage: Decimal = 5
    
    var withFire: Bool = false
    
    var seconds: Int = 0
    
}
