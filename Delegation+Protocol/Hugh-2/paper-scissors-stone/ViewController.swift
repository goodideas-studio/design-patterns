import UIKit

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
