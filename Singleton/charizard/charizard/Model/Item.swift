import Foundation

protocol Item {
  var name: String { get set }
  var price: Int { get set }

  func apply(character: Character)
}
