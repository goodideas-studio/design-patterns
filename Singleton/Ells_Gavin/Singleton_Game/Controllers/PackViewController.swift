//
//  SecondViewController.swift
//  Singleton_Game
//
//  Created by 唐嘉伶 on 26/02/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

protocol PackViewControllerDelegate: class {
  func characterInfoUpdate(packItem: PowerUps)
}

class PackViewController: UIViewController {
  
  @IBOutlet weak var totalAsset: UILabel!
  @IBOutlet weak var totalItems: UILabel!
  @IBOutlet weak var packItemsCollection: UICollectionView!
  @IBOutlet weak var hintView: UIView!
  
  weak var delegate: PackViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    packItemsCollection.delegate = self
    packItemsCollection.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    if Items.shared.itemInPack.count != 0 {
      hintView.isHidden = true
    }
    
    totalAsset.text = String(Asset.shared.totalAsset)
    totalItems.text = String(Items.shared.itemInPack.count)
    
    packItemsCollection.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}

// extension PackViewController to be delegate & datasrc of collectionView
extension PackViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    confirm(indexPath: indexPath)
  }
  
  func confirm(indexPath: IndexPath) {
    let alertController = UIAlertController(title: "使用",
                                            message: "確認要使用？",
                                            preferredStyle: .alert)
    
    let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
    alertController.addAction(cancelAction)
    
    let okAction = UIAlertAction(title: "確定", style: .default) { (action) in
      self.delegate?.characterInfoUpdate(packItem: Items.shared.itemInPack[indexPath.item])
      Items.shared.itemInPack.remove(at: indexPath.item)
      
      self.totalItems.text = String(Items.shared.itemInPack.count)
      if Items.shared.itemInPack.count == 0 {
        self.hintView.isHidden = false
      }
      self.packItemsCollection.reloadData()
    }
    alertController.addAction(okAction)
    
    self.present(alertController, animated: true, completion: nil)
  }
}

extension PackViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return Items.shared.itemInPack.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PackItemCell", for: indexPath) as! PackCollectionViewCell
    
    cell.itemInPackPic.image = Items.shared.itemInPack[indexPath.item].potionImg
    cell.itemInPackPowerVal.text = String(Items.shared.itemInPack[indexPath.item].powerValue)
    cell.itemInPackAffectType.text = String(Items.shared.itemInPack[indexPath.item].attribute)
    return cell
    
  }
  
}
