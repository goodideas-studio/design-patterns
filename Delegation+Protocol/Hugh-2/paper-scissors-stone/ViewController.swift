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

protocol Action {
  var name: String { get }
  var avatar: UIImage { get }
}
class Paper: Action {
  var name = "攻擊"
  var avatar = UIImage(named: "attack")!
}
class Scissors: Action {
  var name = "反擊"
  var avatar = UIImage(named: "counterattack")!
}
class Stone: Action {
  var name = "防禦"
  var avatar = UIImage(named: "defence")!
}

class ViewController: UIViewController {
  var warrior = Character(hp: 20, atk: 2)
  var monster = Character(hp: 20, atk: 1)
  let actions: [Action] = [Paper(), Scissors(), Stone()]
  let warriorView = CharacterView()
  let monsterView = CharacterView()
  var actionImageView = UIImageView()

  override func viewDidLoad() {
    super.viewDidLoad()

    warriorView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
    warriorView.character = warrior

    monsterView.frame = CGRect(x: view.frame.maxX - 200, y: 0, width: 200, height: 100)
    monsterView.character = monster

    let actionsView = ActionsView(frame: CGRect(x: 0, y: view.frame.maxY - 50, width: 200, height: 50))
    actionsView.actions = actions
    actionsView.actionDelegate = self

    let switchButton = UIButton(frame: CGRect(x: view.frame.maxX - 80, y: view.frame.maxY - 50, width: 80, height: 50))
    switchButton.setTitle("Switch", for: .normal)
    switchButton.setTitleColor(.black, for: .normal)
    switchButton.addTarget(self, action: #selector(reset), for: .touchUpInside)

    actionImageView.frame = CGRect(x: warriorView.center.x, y: warriorView.center.y, width: 50, height: 50)

    view.addSubview(warriorView)
    view.addSubview(monsterView)
    view.addSubview(actionsView)
    view.addSubview(switchButton)
    view.addSubview(actionImageView)
  }

  @objc func reset() {
    warrior = Character(hp: Int(arc4random_uniform(30) + 10), atk: Int(arc4random_uniform(5) + 1))
    warriorView.character = warrior
    monster = Character(hp: 20, atk: 1)
    monsterView.character = monster
    actionImageView.image = nil
  }
}

extension ViewController: ActionDelegate {
  func actionDidSelect(_ actionsView: ActionsView, action: Action) {
    actionImageView.image = action.avatar

    let monsterAction = actions[Int(arc4random_uniform(3))]

    switch PSS.execute(actorAction: action, targetAction: monsterAction) {
    case .Tie:
      print("Tie")
    case .ActorWin:
      monster.hp = max(monster.hp - warrior.atk, 0)
    case .ActorLose:
      warrior.hp = max(warrior.hp - monster.atk, 0)
    }

    warriorView.character = warrior
    monsterView.character = monster

    if monster.hp == 0 || warrior.hp == 0 {
      let alert = UIAlertController(title: "遊戲結束", message: "重新開始？", preferredStyle: UIAlertControllerStyle.alert)
      alert.addAction(UIAlertAction(title: "好", style: UIAlertActionStyle.default, handler: { _ in
        self.reset()
      }))
      present(alert, animated: true)
    }
  }
}

enum ActionResult {
  case Tie, ActorWin, ActorLose
}
protocol GameRule {
  static func execute(actorAction: Action, targetAction: Action) -> ActionResult
}
class PSS: GameRule {
  static let rules: [String: ActionResult] = [
    "\(String(describing: Paper.self))_\(String(describing: Stone.self))": ActionResult.ActorLose,
    "\(String(describing: Paper.self))_\(String(describing: Scissors.self))": ActionResult.ActorWin,
    "\(String(describing: Stone.self))_\(String(describing: Paper.self))": ActionResult.ActorWin,
    "\(String(describing: Stone.self))_\(String(describing: Scissors.self))": ActionResult.ActorLose,
    "\(String(describing: Scissors.self))_\(String(describing: Paper.self))": ActionResult.ActorLose,
    "\(String(describing: Scissors.self))_\(String(describing: Stone.self))": ActionResult.ActorWin
  ]

  static func execute(actorAction: Action, targetAction: Action) -> ActionResult {
    if let result = rules["\(String(describing: actorAction).components(separatedBy: ".").last!)_\(String(describing: targetAction).components(separatedBy: ".").last!)"] {
      return result
    }

    return .Tie
  }
}

protocol ActionDelegate {
  func actionDidSelect(_ actionsView: ActionsView, action: Action)
}
class ActionsView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  var actionDelegate: ActionDelegate?

  var actions: [Action]? {
    didSet {
      reloadData()
    }
  }

  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)

    register(ActionView.self, forCellWithReuseIdentifier: "ActionView")

    dataSource = self
    delegate = self

    backgroundColor = .white
  }

  convenience init(frame: CGRect) {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    self.init(frame: frame, collectionViewLayout: layout)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return actions?.count ?? 0 }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: "ActionView", for: indexPath) as! ActionView
    cell.action = actions?[indexPath.row]
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 44, height: 44)
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    actionDelegate?.actionDidSelect(self, action: actions![indexPath.row])
  }
}
class ActionView: UICollectionViewCell {
  var action: Action? {
    didSet {
      contentView.subviews.forEach { $0.removeFromSuperview() }

      if let action = action {
        let label = UILabel(frame: contentView.frame)
        label.text = action.name
        label.textColor = .black
        contentView.addSubview(label)
      }
    }
  }
}
