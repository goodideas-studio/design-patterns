# 各種飲料



## 實作物件：

### 實作出不太貴又可以搖可以喝的Gin Tonic ,  與太貴又不好喝但是可以搖可以點火的 的Martini 。以及不太貴不可以搖又好喝的 Sangria。(note: 每個時做出來的物件必須要有實作方法)

#### 可以試著用 class 或者 protocol 比較兩種不同方式


### 規則：

if Enjoyable, percentage 必須小於 10 % ;
 if Affordable, price  必須小於 200.0



## 實作：

先分別利用 class 實作 GinTonic 及 Martini，兩個 objects 皆需實作

```swift
func shake()
func canPay() -> Bool
func brun()
```

為了減少多餘程式碼，將這些酒類共有的特性進行 abstraction，歸納出以下 protocol :

```swift
protocol Shakable {

  var shakeTimes: Int

  func shake()

}

protocol Burnable {

  var withFire: Bool

  func brun() -> Bool

}

protocol Enjoyable {

  var percentage: Decimal

  func canFinish() -> Bool

}

protocol Affordable {

  var price: Double

  func canPay() -> Bool

}
```

接下來透過 protocol extension 給與這些 protocol 內之 method default 行為:

```swift
extension Shakeable {
  func shake() {
    print("Shake \(self.shakeTimes) seconds")
  }
}

extension Burnable {
  func burn() {
    print("This drink can brun: \(self.withFire)")
  }
}

extension Enjoyable {
  func canFinish() -> Bool {
    return percentage < 10 ? true : false
  }
}

extension Affordable {
  func canPay() -> Bool {
    return self.price < 200 ? true : false
  }
}
```

有了這些酒種的基礎介紹，就可用這些 protocol 來建立各種酒種的物件：

```swift
class Beer: Shakeable, Burnable, Enjoyable, Affordable {
  var shakeTimes: Int = 0
  var withFire: Bool = false
  var percentage: Decimal = 5
  var price: Double = 70
}
var beer = Beer()
beer.canPay()

class DoubleMartini: Shakeable, Burnable, Enjoyable, Affordable {
  var shakeTimes: Int = 10
  var withFire: Bool = true
  var percentage: Decimal = 35
  var price: Double = 250
}

var doubleMartini = DoubleMartini()
doubleMartini.canPay()
```

當呼叫 canPay() 時則可依照酒類的價格是否超過 200 元來決定是否購買。





