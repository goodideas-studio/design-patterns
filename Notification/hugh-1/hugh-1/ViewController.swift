import UIKit

extension Notification.Name {
  static let HUGHStartFighting = Notification.Name("HUGHStartFighting")
  static let HUGHResetFighting = Notification.Name("HUGHResetFighting")
  static let HUGHCharacterDidChange = Notification.Name("HUGHCharacterDidChange")
}

class Character: NSObject, NSCopying {
  var hp: Int

  init(hp: Int) {
    self.hp = hp
  }

  func copy(with zone: NSZone?) -> Any {
    return Character(hp: hp)
  }
}
class CharacterView: UIView {
  var character: Character? {
    didSet {
      if let character = character {
        hpLabel.text = "\(character.hp)"
      }
    }
  }

  private var hpLabel: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)

    backgroundColor = .black
    hpLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height / 3))
    hpLabel.textColor = .white
    addSubview(hpLabel)
  }

  required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

class RingViewController: UIViewController {
  lazy var leftCharacterView: CharacterView = {
    return CharacterView(frame: CGRect(x: 0, y: 50, width: 100, height: 100))
  }()

  lazy var rightCharacterView: CharacterView = {
    return CharacterView(frame: CGRect(x: view.frame.width - 100, y: 50, width: 100, height: 100))
  }()

  lazy var equipmentView: UILabel = {
    let label = UILabel(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
    label.textColor = .white
    return label
  }()

  var timer: Timer?

  var originalLeftCharacter: Character? {
    didSet {
      leftCharacter = originalLeftCharacter?.copy() as? Character
    }
  }
  var leftCharacter: Character? {
    didSet {
      if let leftCharacter = leftCharacter {
        leftCharacterView.character = leftCharacter
      }
    }
  }

  var originalRightCharacter: Character? {
    didSet {
      rightCharacter = originalRightCharacter?.copy() as? Character
    }
  }
  var rightCharacter: Character? {
    didSet {
      if let rightCharacter = rightCharacter {
        rightCharacterView.character = rightCharacter
      }
    }
  }

  override init(nibName: String?, bundle: Bundle?) {
    super.init(nibName: nibName, bundle: bundle)

    view.addSubview(leftCharacterView)
    view.addSubview(rightCharacterView)
    view.addSubview(equipmentView)

    NotificationCenter.default.addObserver(self, selector: #selector(fightingDidStart), name: .HUGHStartFighting, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(fightingDidReset), name: .HUGHResetFighting, object: nil)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc func fightingDidStart() {
    guard let leftCharacter = leftCharacter, let rightCharacter = rightCharacter else {
      return
    }

    timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
      UIView.animate(withDuration: 0.5, animations: {
        self.equipmentView.frame.origin.x += 100
      }, completion: { success in
        self.equipmentView.frame.origin.x -= 100

        leftCharacter.hp = max(0, leftCharacter.hp - 10)
        self.leftCharacter = leftCharacter

        rightCharacter.hp = max(0, rightCharacter.hp - 10)
        self.rightCharacter = rightCharacter

        self.notifyCharactersChange()

        if leftCharacter.hp * rightCharacter.hp == 0 {
          timer.invalidate()
        }
      })
    }

    timer?.fire()
  }

  @objc func fightingDidReset() {
    timer?.invalidate()

    leftCharacter = originalLeftCharacter
    rightCharacter = originalRightCharacter

    notifyCharactersChange()
  }

  func notifyCharactersChange() {
    guard leftCharacter != nil, rightCharacter != nil else {
      return
    }

    NotificationCenter.default.post(name: .HUGHCharacterDidChange, object: self)
  }
}
class AttackViewController: RingViewController {
  override var title: String? {
    get { return super.title ?? "A" }
    set { super.title = newValue }
  }

  override init(nibName: String?, bundle: Bundle?) {
    super.init(nibName: nibName, bundle: bundle)

    originalLeftCharacter = Character(hp: 100)
    originalRightCharacter = Character(hp: 200)
    equipmentView.text = "劍"
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
class DefenceViewController: RingViewController {
  override var title: String? {
    get { return super.title ?? "D" }
    set { super.title = newValue }
  }


  override init(nibName: String?, bundle: Bundle?) {
    super.init(nibName: nibName, bundle: bundle)

    originalLeftCharacter = Character(hp: 199)
    originalRightCharacter = Character(hp: 100)
    equipmentView.text = "盾"
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}
class MagicViewController: RingViewController {
  override var title: String? {
    get { return super.title ?? "M" }
    set { super.title = newValue }
  }

  override init(nibName: String?, bundle: Bundle?) {
    super.init(nibName: nibName, bundle: bundle)

    originalLeftCharacter = Character(hp: 120)
    originalRightCharacter = Character(hp: 150)
    equipmentView.text = "魔法"
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
}

class ViewController: UIViewController {
  override var title: String? {
    get { return super.title ?? "H" }
    set { super.title = newValue }
  }

  lazy var labels: [String: UILabel] = {
    var labels = [String: UILabel]()
    var y = 50

    tabBarController?.viewControllers?.filter({ controller in controller.title != title }).forEach { controller in
      if let title = controller.title {
        labels[title] = UILabel(frame: CGRect(x: 50, y: y, width: 200, height: 50))
        y += 50
      }
    }

    return labels
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    let startButton = UIButton(frame: CGRect(x: 50, y: view.frame.height / 2, width: 50, height: 50))
    startButton.setTitle("Start", for: .normal)
    startButton.setTitleColor(.white, for: .normal)
    startButton.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
    view.addSubview(startButton)

    let resetButton = UIButton(frame: CGRect(x: view.frame.width / 2, y: view.frame.height / 2, width: 50, height: 50))
    resetButton.setTitle("Reset", for: .normal)
    resetButton.setTitleColor(.white, for: .normal)
    resetButton.addTarget(self, action: #selector(resetButtonDidTap), for: .touchUpInside)
    view.addSubview(resetButton)

    NotificationCenter.default.addObserver(self, selector: #selector(fightingRoundDidEnd), name: .HUGHCharacterDidChange, object: nil)

    labels.forEach { _, label in
      label.textColor = .white
      view.addSubview(label)
    }
  }

  @objc func startButtonDidTap() {
    NotificationCenter.default.post(name: .HUGHStartFighting, object: nil)
  }

  @objc func resetButtonDidTap() {
    NotificationCenter.default.post(name: .HUGHResetFighting, object: nil)
  }

  @objc func fightingRoundDidEnd(note: Notification) {
    guard let object = note.object as? RingViewController, let title = object.title, let leftCharacter = object.leftCharacterView.character, let rightCharacter = object.rightCharacterView.character, let label = labels[title] else {
      return
    }

    if leftCharacter.hp * rightCharacter.hp == 0 {
      label.text = "Finished"
    } else {
      label.text = "\(title): \(leftCharacter.hp) - \(rightCharacter.hp)"
    }
  }
}
