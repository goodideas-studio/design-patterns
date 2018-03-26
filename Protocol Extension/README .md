# 各種飲料




## 實作物件：

### 實作出不太貴又可以搖可以喝的Gin Tonic ,  與太貴又不好喝但是可以搖可以點火的 的Martini 。以及不太貴不可以搖又好喝的 Sangria

## 製作方法
```
protocol Shakable {
var seconds: Int
func shake(time: Int)
}
protocol Burnable {
var withFire: Bool
func brun()
}
protocol Drinkable {
var isOverCooked: Bool
func drink()
}
protocol Enjoyable {
var percentage: Decimal
func canFinish()
}

protocol Affordable {
var price: Double
func canPay()
}
```

### 規則：
if Drinkable, isOverCooked 必須是 false ;
if Enjoyable, percentage 必須小於 10 % ;
 if Affordable, price  必須小於 200.0



