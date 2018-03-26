
import Foundation
//使用電鍋蒸熟白米
//將白米冰入冰箱放置 24 小時，於炒飯前取出放置室溫 1 小時
//熱鍋、加油，並將蛋白與蔥炒香
//將白飯與蛋黃拌勻，丟入鍋中炒 7749 秒
//於 7750 秒將炒飯倒入盤中冷卻
//完成
//後來仙廚決定引進人類最新科技「炒飯達人」，只需要將原本的原料（Struct）投入「炒飯達人」，即可在 24 小時後取得香噴噴的「完美炒飯」。

// 原料
struct 蛋黃 {
  var 熟了: Bool
}
struct 白米 {
  var 熟了: Bool
}
struct 油 {
  var 加油: Bool
}
struct 蛋白 {
  var 炒香了: Bool
}
struct 蔥 {
  var 炒香了: Bool
}
struct 時間 {
  var seconds: Float
}
struct 完美炒飯 {
  var isPerfect: Bool
}

// 鍋具
class 電鍋 {
  var rice = 白米(熟了: false)
  
  func cook(ingredient: 白米) -> Bool {
    return true
  }
}
class 冰箱 {
  var cookedRice = 白米(熟了: true)
  
  func store(rice: 白米, time: 時間) -> Bool {
    if time.seconds > 24*60*60 {
      return true
    } else { return false }
  }
}


var perfectRice = 白米(熟了: true)
var perfectEggWhite = 蛋白(炒香了: true)
var perfectEggYellow = 蛋黃(熟了: true)
var perfectGinger = 蔥(炒香了: true)
var perfectOil = 油(加油: true)
var perfectOverCookTime = 時間(seconds: 7750)

class 炒飯達人 {
  
  
  var perfectFiredRice = 完美炒飯(isPerfect: false)
  
  func pot(rice: 白米, eggWhite: 蛋白, eggYellow: 蛋黃, ginger: 蔥, oil: 油, cookTime: 時間) -> Bool {
    if rice.熟了 == true && eggWhite.炒香了 == true && eggYellow.熟了 == true, ginger.炒香了 == true && cookTime.seconds >= 7749 {
      perfectFiredRice.isPerfect = true
    } else {
      perfectFiredRice.isPerfect = false
    }
    
    return perfectFiredRice.isPerfect
  }
}



let mom = 炒飯達人()
mom.pot(rice: perfectRice, eggWhite: perfectEggWhite, eggYellow: perfectEggYellow, ginger: perfectGinger, oil: perfectOil, cookTime: perfectOverCookTime)

mom.perfectFiredRice.isPerfect


