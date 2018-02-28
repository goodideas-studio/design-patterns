import UIKit

class BagVC: UIViewController {
  @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var reminderLabel: UILabel!
    
    
    //storyboard init先呼叫此方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBarItem = UITabBarItem(title: "Bag", image: UIImage(named: "Bag")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "Bag")?.withRenderingMode(.alwaysOriginal))
    }
    
  override func viewDidLoad() {
    super.viewDidLoad()
//    if let bagVC = self.navigationController?.tabBarController?.viewControllers![1] as? BagVC{
//        print("add")
//        bagVC.tabBarItem = UITabBarItem(title: "Bag", image: UIImage(named: "Bag"), selectedImage: UIImage(named: "Bag")?.withRenderingMode(.alwaysOriginal))
//    }
//    self.tabBarItem = UITabBarItem(title: "Bag", image: UIImage(named: "Bag")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "Bag")?.withRenderingMode(.alwaysOriginal))
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
        } else {
          collectionView.isHidden = false
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
    cell.imageView.image = UIImage(named: GameManager.current.player!.items[indexPath.row].name)
//    cell.nameLabel.text = GameManager.current.player!.items[indexPath.row].name

    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let alert = UIAlertController(title: "確定使用？", message: nil, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
    alert.addAction(UIAlertAction(title: "確定", style: .default) { _ in
      GameManager.current.player!.items[indexPath.row].apply(character: GameManager.current.character!)
      GameManager.current.player!.items.remove(at: indexPath.row)
      self.navigationItem.title = "\(GameManager.current.player!.items.count)"
      collectionView.reloadData()
        if (GameManager.current.player?.items.isEmpty)!{
            collectionView.isHidden = true
            self.reminderLabel.text = "道具用完了，請去商城購買"
        }
    })
    present(alert, animated: true, completion: nil)
  }
}
