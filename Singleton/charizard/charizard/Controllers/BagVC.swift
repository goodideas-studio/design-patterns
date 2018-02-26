import UIKit

class BagVC: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()

    collectionView.delegate = self
    collectionView.dataSource = self
  }
}

extension BagVC: UICollectionViewDelegate, UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return GameManager.current.player!.items.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BagItemCollectionViewCell else {
      fatalError()
    }

    cell.nameLabel.text = GameManager.current.player!.items[indexPath.row].name

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    GameManager.current.player!.items[indexPath.row].apply(character: GameManager.current.character!)
    GameManager.current.player!.items.remove(at: indexPath.row)
    collectionView.reloadData()
  }
}
