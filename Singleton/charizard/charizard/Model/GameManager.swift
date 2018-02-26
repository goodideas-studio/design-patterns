import Foundation

class GameManager {
  static let current = GameManager()

  var character: Character?
  var player: Player?

  private init() {}
}
