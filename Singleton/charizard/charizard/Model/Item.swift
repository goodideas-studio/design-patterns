import Foundation

protocol Item {
  var name: String { get set }
  var price: Int { get set }

  func apply(character: Character)
}

class RedWater:Item{
    
    var name: String
    
    var price: Int
    
    init(name:String, price:Int) {
        self.name = name
        self.price = price
    }
    
    func apply(character: Character) {
        character.HP += 10
    }
    
}

class BlueWater:Item{
    var name: String
    
    var price: Int
    
    init(name:String, price:Int) {
        self.name = name
        self.price = price
    }
    
    func apply(character: Character) {
        character.MP += 5
    }
    
}
