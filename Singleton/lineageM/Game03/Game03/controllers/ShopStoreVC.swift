//
//  ShopStoreVC.swift
//  Game03
//
//  Created by 高菘駿 on 2018/2/26.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit


class ShopStoreVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var shopStoreCollectionView: UICollectionView!
    
    var shopItems = ["red_potion", "orange_potion", "clear_potion", "atk_potion", "def_potion", "ancient_red_potion", "ancient_orange_potion", "ancient_clear_potion"]
    
    
    
    @IBOutlet var moneyLabel: UILabel!
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 100
//        return Backpack.current.backpackItems.count
        
        return shopItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopStoreCell", for: indexPath) as! BackpackCell
//        cell.backpackItemImageView.image = UIImage(named: Backpack.current.backpackItems[indexPath.row])
        
        cell.backpackItemImageView.image = UIImage(named: shopItems[indexPath.row])
        return cell
    }

    func checkMoney(indexPath: IndexPath, itemName: String ) {
        for (itemName, itemPrice) in ItemsPrice.shared.itemNameAndItemPrice {
            if shopItems[indexPath.row] == itemName {
                if Money.current.moneyNumber >= itemPrice {
                
                    let purchaseAlert = UIAlertController(title:"購買道具",message:"確認要購買嗎？",preferredStyle:.alert)
                    let confirmAction = UIAlertAction(title:"確定",style:.default){(action)in
                        //購買成功
                        Backpack.current.addItems(itemName: self.shopItems[indexPath.row])
                        Money.current.moneyNumber = Money.current.moneyNumber - itemPrice
            
                        self.moneyLabel.text = "$: \(Money.current.moneyNumber)"
                        self.shopItems.remove(at: indexPath.row)
                        self.shopStoreCollectionView.reloadData()
                    
                        //當商店為空
                        if self.shopItems == [] {
                        let emptyAlert = UIAlertController(title: "商店進貨中", message: "請下次再來", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "確認", style: .default, handler: { (action) in
                            print("商店為空")
                        })
                        emptyAlert.addAction(okAction)
                        self.present(emptyAlert, animated: true, completion: nil)
                    }
                    
                }
                let cancelAction = UIAlertAction(title:"取消",style:.cancel)
                purchaseAlert.addAction(confirmAction)
                purchaseAlert.addAction(cancelAction)
                present(purchaseAlert, animated: true, completion: nil)
                
            }
            else {
                let alert = UIAlertController(title: "金額不足", message: "請努力打怪", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "確認", style: .cancel)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
            checkMoney(indexPath: indexPath, itemName: shopItems[indexPath.row])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        moneyLabel.text = "$: \(Money.current.moneyNumber)"
        if self.shopItems == [] {
            let emptyAlert = UIAlertController(title: "商店進貨中", message: "請下次再來", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "確認", style: .default, handler: { (action) in
                print("商店為空")
            })
            emptyAlert.addAction(okAction)
            self.present(emptyAlert, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
}
