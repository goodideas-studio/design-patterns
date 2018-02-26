import UIKit

class RedWater: Item {
  var name = "红药水"
  var price = 20

  func apply(character: Character) {
    character.HP += 100000
  }
}

class GameVC: UIViewController {
  @IBOutlet weak var HPLabel: UILabel!
  @IBOutlet weak var MPLabel: UILabel!
  @IBOutlet weak var ATKLabel: UILabel!
  @IBOutlet weak var DEFLabel: UILabel!
  @IBOutlet weak var balanceLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
    
  @IBAction func didTouchUpWeapon(_ sender: Any) {
    GameManager.current.player!.balance += 5
    balanceLabel.text = "\(GameManager.current.player!.balance)"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    GameManager.current.player = Player(balance: 1000, items: [RedWater()])
    GameManager.current.character = Character(ATK: 10, DEF: 20, HP: 30, MP: 40)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    HPLabel.text = "\(GameManager.current.character!.HP)"
    MPLabel.text = "\(GameManager.current.character!.MP)"
    ATKLabel.text = "\(GameManager.current.character!.ATK)"
    DEFLabel.text = "\(GameManager.current.character!.DEF)"
    balanceLabel.text = "\(GameManager.current.player!.balance)"
    imageView.image = UIImage(named: "charizard")
  }
}
