import Foundation

// 實作出不太貴又可以搖可以喝的 Gin Tonic
// 與太貴又不好喝但是可以搖可以點火的的 Martini
// 以及不太貴不可以搖又好喝的 Sangria

/*
    首先我分別寫三個 Class，代表三種飲品，並直接設定 Property、Method，
    使這三個物件符合題目條件。
*/
class GinTonic {
    var price: Decimal = 199
    var isOverCooked: Bool = false
    var seconds: Int = 1

    func shakable() -> Bool {
        return seconds < 10
    }

    func drinkable() -> Bool {
        return !isOverCooked
    }

    func canPay() -> Bool {
        return price <= 200
    }
}

class Martini {
    var price: Decimal = 201
    var percentage: Decimal = 50
    var seconds: Int = 5

    func shakable() -> Bool {
        return seconds < 10
    }

    func canFinish() -> Bool {
        return percentage < 10
    }

    func canPay() -> Bool {
        return price <= 200
    }
}

class Sangria {
    var price: Decimal = 150
    var percentage: Decimal = 5
    var seconds: Int = 11

    func shakable() -> Bool {
        return seconds < 10
    }

    func canFinish() -> Bool {
        return percentage < 10
    }
}

/*
    可以發現有重複的程式碼，且我沒辦法事先知道這個「飲品」有哪些方法可以用。

    比方說我在使用 GinTonic 這個物件時，我以為它是飲品，想呼叫 canFinish 看看好不好喝，
    結果發現 GinTonic 根本沒有這個方法可以呼叫，雖然我們可以再加上 canFinish 的方法解決，
    但我想說的是，我們沒有一個像是法律的東西，可以「約束」飲品必須有這些方法，造成程式開發、使用時，
    過度依賴「工程師」的腦袋。

    所以這時候我們可以用 Protocol 來改善這樣的窘境，讓各種飲品的使用方式能更清晰。
*/

protocol Shakable {
    var seconds: Int { get }

    func shakable() -> Bool
}

protocol Drinkable {
    var isOverCooked: Bool { get }

    func drinkable() -> Bool
}

protocol Enjoyable {
    var percentage: Decimal { get }

    func canFinish() -> Bool
}

protocol Affordable {
    var price: Decimal { get }

    func canPay() -> Bool
}

/*
    有了這幾個 protocol 之後，我們對上面的 class 進行改寫。
*/

class NewGinTonic: Shakable, Drinkable, Affordable {
    // Shakable protocol
    private(set) var seconds: Int = 1

    func shakable() -> Bool {
        return true
    }

    // Drinkable protocol
    private(set) var isOverCooked: Bool = false

    func drinkable() -> Bool {
        return !isOverCooked
    }

    // Affordable protocol
    private(set) var price: Decimal = 199

    func canPay() -> Bool {
        return price < 200
    }
}

class NewMartini: Shakable, Enjoyable, Affordable {
    private(set) var seconds: Int = 5

    func shakable() -> Bool {
        return true
    }

    // Enjoyable protocol
    private(set) var percentage: Decimal = 50

    func canFinish() -> Bool {
        return percentage < 10
    }

    private(set) var price: Decimal = 201

    func canPay() -> Bool {
        return price < 200
    }
}

class NewSangria: Shakable, Enjoyable, Affordable {
    private(set) var seconds: Int = 11

    func shakable() -> Bool {
        return false
    }

    private(set) var percentage: Decimal = 5

    func canFinish() -> Bool {
        return percentage < 10
    }

    private(set) var price: Decimal = 150

    func canPay() -> Bool {
        return price < 200
    }
}

/*
    至此，其實我只是加上了 protocol 的空殼，因為還是沒有解決有的飲品有 canFinish，有的沒有的窘境。

    因此我決定建立一個「飲品」protocol，所有「飲品」都必須實做。
*/

protocol Drinks: Shakable, Drinkable, Enjoyable, Affordable {}

class NewNewGinTonic: Drinks {
    // Shakable protocol
    private(set) var seconds: Int = 1

    func shakable() -> Bool {
        return true
    }

    // Drinkable protocol
    private(set) var isOverCooked: Bool = false

    func drinkable() -> Bool {
        return !isOverCooked
    }

    // Affordable protocol
    private(set) var price: Decimal = 199

    func canPay() -> Bool {
        return price < 200
    }

    private(set) var percentage: Decimal = 1

    func canFinish() -> Bool {
        return percentage < 10
    }
}

class NewNewMartini: Drinks {
    private(set) var seconds: Int = 5

    func shakable() -> Bool {
        return true
    }

    // Enjoyable protocol
    private(set) var percentage: Decimal = 50

    func canFinish() -> Bool {
        return percentage < 10
    }

    private(set) var price: Decimal = 201

    func canPay() -> Bool {
        return price < 200
    }

    private(set) var isOverCooked: Bool = false

    func drinkable() -> Bool {
        return !isOverCooked
    }
}

class NewNewSangria: Drinks {
    private(set) var seconds: Int = 11

    func shakable() -> Bool {
        return false
    }

    private(set) var percentage: Decimal = 5

    func canFinish() -> Bool {
        return percentage < 10
    }

    private(set) var price: Decimal = 150

    func canPay() -> Bool {
        return price < 200
    }

    private(set) var isOverCooked: Bool = false

    func drinkable() -> Bool {
        return !isOverCooked
    }
}

/*
    至此，我完成了飲料的界面，來到了大一統時代。

    發現了嗎？很多 Class 裡面為了實做 Drinks 寫了「一模一樣」的方法！

    是時候使用 protocol extension 祕法了！
*/

extension Drinks {
    func shakable() -> Bool {
        return seconds < 10
    }

    func drinkable() -> Bool {
        return !isOverCooked
    }

    func canFinish() -> Bool {
        return percentage < 10
    }

    func canPay() -> Bool {
        return price < 200
    }
}

class PerfectGinTonic: Drinks {
    private(set) var seconds: Int = 1
    private(set) var isOverCooked: Bool = false
    private(set) var price: Decimal = 199
    private(set) var percentage: Decimal = 1
}

class PerfectMartini: Drinks {
    private(set) var seconds: Int = 5
    private(set) var percentage: Decimal = 50
    private(set) var price: Decimal = 201
    private(set) var isOverCooked: Bool = false
}

class PerfectSangria: Drinks {
    private(set) var seconds: Int = 11
    private(set) var percentage: Decimal = 5
    private(set) var price: Decimal = 150
    private(set) var isOverCooked: Bool = false
}
