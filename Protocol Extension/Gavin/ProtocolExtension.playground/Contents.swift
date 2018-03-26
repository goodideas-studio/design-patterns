import Foundation

//Gin Tonic: cheap, shake, teast good
class GinTonic {
  var shakeTime: Decimal = 10
  var price: Double = 120
  var withFire: Bool = false

  func shake() {
    print("Shake \(self.shakeTime) seconds")
  }

  func canPay() -> Bool {
    return self.price > 150 ? false : true
  }
  
  func brun() {
    print("This drink is brunable: \(self.withFire)")
  }
}

var ginTonic = GinTonic()
ginTonic.shake()
ginTonic.canPay()

//Martini: Expensive, taste not good, shake, can brun
class Martini {
  var shakeTime: Decimal = 20
  var price: Double = 250
  var withFire: Bool = true

  func shake() {
    print("Shake \(self.shakeTime) seconds")
  }

  func canPay() -> Bool {
    return self.price > 150 ? false : true
  }

  func brun() {
    print("This drink is brunable: \(self.withFire)")
  }
}
var martini = Martini()
martini.canPay()


protocol Shakeable {
  var shakeTimes: Int { get }
  func shake()
}

protocol Burnable {
  var withFire: Bool { get }
  func burn()
}

protocol Enjoyable {
  var percentage: Decimal { get }
  func canFinish() -> Bool
}

protocol Affordable {
  var price: Double { get }
  func canPay() -> Bool
}

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
