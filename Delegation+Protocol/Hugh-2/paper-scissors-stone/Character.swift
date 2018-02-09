import UIKit

class Character {
  var hp: Int
  var atk: Int
  var avatar: UIImage

  init(hp: Int, atk: Int) {
    self.hp = hp
    self.atk = atk
    self.avatar = UIImage(named: "character\(arc4random_uniform(3))")!
  }
}

class CharacterView: UIView {
  var character: Character? {
    didSet {
      if let character = character {
        subviews.forEach { $0.removeFromSuperview() }

        let label = UILabel()
        label.text = "HP: \(character.hp), ATK: \(character.atk)"
        label.sizeToFit()
        label.frame.origin = .zero
        label.textColor = .black
        addSubview(label)

        let avatarImageView = UIImageView(image: character.avatar)
        avatarImageView.frame = CGRect(x: 0, y: label.frame.maxY, width: frame.width, height: frame.height - label.frame.maxY)
        avatarImageView.contentMode = .scaleAspectFit
        addSubview(avatarImageView)
      }
    }
  }
}
