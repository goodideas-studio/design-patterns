import UIKit

class GameVC: UIViewController {
  @IBOutlet weak var HPLabel: UILabel!
  @IBOutlet weak var MPLabel: UILabel!
  @IBOutlet weak var ATKLabel: UILabel!
  @IBOutlet weak var DEFLabel: UILabel!
  @IBOutlet weak var balanceLabel: UILabel!

  @IBAction func didTouchUpWeapon(_ sender: Any) {
    GameManager.current.player!.balance += 5
    balanceLabel.text = "\(GameManager.current.player!.balance)"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    GameManager.current.player = Player(balance: 1000, items: [])
    GameManager.current.character = Character(ATK: 10, DEF: 20, HP: 30, MP: 40)

    HPLabel.text = "\(GameManager.current.character!.HP)"
    MPLabel.text = "\(GameManager.current.character!.MP)"
    ATKLabel.text = "\(GameManager.current.character!.ATK)"
    DEFLabel.text = "\(GameManager.current.character!.DEF)"
    balanceLabel.text = "\(GameManager.current.player!.balance)"
  }
}
