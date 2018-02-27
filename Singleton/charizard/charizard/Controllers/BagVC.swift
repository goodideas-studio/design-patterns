import UIKit

class BagVC: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var reminderLabel: UILabel!
    
  override func viewDidLoad() {
    super.viewDidLoad()

    NotificationCenter.default.addObserver(self, selector: #selector(updateUI), name: NSNotification.Name(rawValue: didTappedShoppingItemKey), object: nil)
    
    collectionView.delegate = self
    collectionView.dataSource = self
  }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
        navigationItem.title = "\(GameManager.current.player!.items.count)"
        if (GameManager.current.player?.items.isEmpty)!{
            collectionView.isHidden = true
            reminderLabel.text = "道具用完了，請去商城購買"
        }
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
    let alert = UIAlertController(title: "確定使用？", message: "價錢：\(GameManager.current.player!.items[indexPath.row].price)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
    alert.addAction(UIAlertAction(title: "確定", style: .default) { _ in
      GameManager.current.player!.items[indexPath.row].apply(character: GameManager.current.character!)
      GameManager.current.player!.items.remove(at: indexPath.row)
      self.title = "\(GameManager.current.player!.items.count)"
      collectionView.reloadData()
        if (GameManager.current.player?.items.isEmpty)!{
            collectionView.isHidden = true
            self.reminderLabel.text = "道具用完了，請去商城購買"
        }
    })
    present(alert, animated: true, completion: nil)
  }
    
  
    @objc func updateUI(){
        title = "\(GameManager.current.player!.items.count)"
    }
    
}
