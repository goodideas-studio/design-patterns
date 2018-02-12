import UIKit

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
