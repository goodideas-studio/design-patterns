//
//  ShopViewController.swift
//  Singleton_Game
//
//  Created by 唐嘉伶 on 26/02/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

protocol ShopViewControllerDelegate: class {
  func shopItemUpdate(shopItem: PowerUps)
    
}

class ShopViewController: UIViewController {
    
  @IBOutlet weak var shopItemCollection: UICollectionView!
  @IBOutlet weak var moneyRemaining: UILabel!
  @IBOutlet weak var itemsRemainedInShop: UILabel!
  
  var delegate: ShopViewControllerDelegate?
    
  override func viewDidLoad() {
    super.viewDidLoad()
        
    self.shopItemCollection.delegate = self
    self.shopItemCollection.dataSource = self
       
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
        
    moneyRemaining.text = String(Asset.shared.totalAsset)
    itemsRemainedInShop.text = String(Items.shared.itemInShop.count)
  }
}

extension ShopViewController: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    purchase(indexPath: indexPath)
  }
    
  func purchase(indexPath: IndexPath) {
    if Int(Asset.shared.totalAsset) < Items.shared.itemInShop[indexPath.item].price {
      let bankrupt = UIAlertController(title: "Ouch", message: "Not enough amount", preferredStyle: .alert)
      let alright = UIAlertAction(title: "ok", style: .default, handler: nil)
      bankrupt.addAction(alright)
      self.present(bankrupt, animated: true, completion: nil)
    } else {
      let alertController = UIAlertController(title: "購買",
                                              message: "確認要購買？",
                                              preferredStyle: .alert)
      
      let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
      alertController.addAction(cancelAction)
      
      let okAction = UIAlertAction(title: "確定", style: .default) { (action) in
        
        
        self.moneyRemaining.text = String(Asset.shared.decrease(money: Items.shared.itemInShop[indexPath.item].price))
        
        Items.shared.itemInPack.append(Items.shared.itemInShop[indexPath.item])
        Items.shared.itemInShop.remove(at: indexPath.item)
      
        self.itemsRemainedInShop.text = String(Items.shared.itemInShop.count)
        self.shopItemCollection.reloadData()
        
        
      }
      alertController.addAction(okAction)
      
      self.present(alertController, animated: true, completion: nil)
    }
  }
}

extension ShopViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    return Items.shared.itemInShop.count
  }
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ShopItemCollectionCell
    cell.itemInShopPic.contentMode = .scaleAspectFit
    cell.itemInShopPic.image = Items.shared.itemInShop[indexPath.item].potionImg
    cell.itemInShopPrice.text = String(Items.shared.itemInShop[indexPath.item].price)
    cell.itemInShopPowerVal.text = String(Items.shared.itemInShop[indexPath.item].powerValue)
    cell.itemInShopAffectType.text = String(Items.shared.itemInShop[indexPath.item].attribute)
    
    return cell
  }
}
