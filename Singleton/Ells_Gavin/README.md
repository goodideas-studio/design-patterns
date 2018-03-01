# YikYak Adventure

![](https://i.imgur.com/8fqvD85.gif)

## Description
  被從 APP Store 下架之後， YY 只好展開了冒(跑)險(路)之旅。

## Views
###Tab View one: 

YY 只要按下紅色按鈕，就可以增加金錢 

###Tab View two: 

裡面的藥水，有四個屬性: HP, MP, Defense, Attack ，(點選)喝下之後藥水會消失，並會依據藥水屬性可以分別加成屬性。

###Tab View three: 

YY 在這裡可以購買藥水。如果錢不夠時，會彈出警告視窗無法購買。

## 主要物件
  錢：全域物件。依據操作而增減，並會顯示在每個 Tab View。
  藥水：使用一次即會消失。分成 HP, MP, Defense, Attack 四種功效。不同藥水有不同價格。

## 物件設計
### 在遊戲中，共有三個物件使用了 singleton  設計模式：錢 , 背包內的藥水與商店內的藥水。
錢：因為錢包只有一個，要讓 YY 可以在任何 view controllers 使用(增加及減少)錢的數量，所以採用 singleton 的設計方式來創建這個物件。

藥水：分別為 Y 背包內的藥水，與商店內的藥水。
#### 背包
目前現有的藥水。
#### 商店
購買藥水，藥水的數量是有限的。


註：
當我們希望一個物件只被創建一次，singleton 設計模式就提供了一個很好的選擇，其寫作方法如下：

```
class Asset {
  static let shared = Asset()
  var totalAsset: Int = 100

  private init() {
    print("Asset create.")
  }
}
```
singleton 中的 static 指定了物件在 APP 中的記憶體位置，並且透過關鍵字 "private" 來限制該 class 的 init( ) 之存取權限，使之無法透過 init () 來建立該 class 之 instance ，僅能透過本身的 shared property 來建立 instance。之後不管如何修改該物件內變數內容，都是對同一塊記憶體做修改。