import UIKit



class GameVC: UIViewController {
  @IBOutlet weak var HPLabel: UILabel!
  @IBOutlet weak var MPLabel: UILabel!
  @IBOutlet weak var ATKLabel: UILabel!
  @IBOutlet weak var DEFLabel: UILabel!
  @IBOutlet weak var balanceLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
    
  @IBAction func didTouchUpWeapon(_ sender: Any) {
    GameManager.current.player!.balance += 5
    balanceLabel.text = "$:\(GameManager.current.player!.balance)"
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    for viewController in (self.tabBarController?.viewControllers)!{
        _ = viewController.view
    }
    
    
    GameManager.current.player = Player(balance: 2000, items: [])
    GameManager.current.character = Character(ATK: 10, DEF: 20, HP: 30, MP: 40)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    HPLabel.text = "HP:\(GameManager.current.character!.HP)"
    MPLabel.text = "MP:\(GameManager.current.character!.MP)"
    ATKLabel.text = "ATK:\(GameManager.current.character!.ATK)"
    DEFLabel.text = "DEF:\(GameManager.current.character!.DEF)"
    balanceLabel.text = "$:\(GameManager.current.player!.balance)"
    imageView.image = UIImage(named: "charizard")
  }
}
