//
//  ShopViewController.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

protocol ShopDelegate {
    func PutInPack(itemName:String)
}



class ShopViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 創建 Shop 實例
    var shop = Shop()
    
    // Delegate
    var shopItemDelegate:ShopDelegate?
    
    
    @IBOutlet weak var messageView: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var shopLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading ShopView")
        
        
        // shop 排版
        shopLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        shopLayout.itemSize = CGSize(width: 150 , height: 150)
        shopLayout.minimumLineSpacing = CGFloat(integerLiteral: 10)
        shopLayout.minimumInteritemSpacing = CGFloat(integerLiteral: 10)
        
        shopCollectionView.dataSource = self
        shopCollectionView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        moneyLabel.text = "Money:\(Character.shared.dollars)"
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    
    
    // CollectionView協定
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shop.shopItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        let shopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        shopButton.tag = indexPath.row
        shopButton.setImage(UIImage(named: shop.shopItem[indexPath.row].itemName), for: .normal)
        shopButton.addTarget(self, action: #selector(showShopAlert), for: UIControlEvents.touchUpInside)
        
        cell.addSubview(shopButton)
        
        return cell
    }
    
    // Selector Cell按鈕方法
    @objc func showShopAlert(sender:UIButton) -> String{
        
        if Character.shared.dollars <= shop.shopItem[sender.tag].dollars {
            
            UIView.animate(withDuration: 0.4, animations: {
                self.messageView.alpha = 1
                self.messageView.center.y -= 20
            }, completion: { (finish) in
                UIView.animate(withDuration: 1, animations: {
                    self.messageView.alpha = 0
                }, completion: { (finish) in
                    self.messageView.center.y += 20
                })
                
            })
            
            
        } else {
            let shopAlert = UIAlertController(title: "Check", message: "確認要購買？", preferredStyle: UIAlertControllerStyle.alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (finish) in
                print("取消購買")
            }
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (finish) in
                Character.shared.dollars -= self.shop.shopItem[sender.tag].dollars
                self.moneyLabel.text = "Money:$\(Character.shared.dollars)"
                
                
                
                // tabbar 方式傳值到 PackViewController
                if let packVC = self.tabBarController?.viewControllers![1] as? PackViewController {
                    
                    // 增加 ItemInPack
                    packVC.ItemInPack.append(self.shop.shopItem[sender.tag])
                    // 修改標題 物品數量
                    packVC.itemCount.text = "ItemCount:\(packVC.ItemInPack.count)"
                    
                }
                
                self.shop.shopItem.remove(at: sender.tag)
                
                if self.shop.shopItem.isEmpty == true {
                    self.messageView.alpha = 1
                    self.messageView.text = "沒有物品"
                    self.shopCollectionView.reloadData()
                } else {
                    self.shopCollectionView.reloadData()
                }
            }
            shopAlert.addAction(cancelAction)
            shopAlert.addAction(okAction)
            
            self.present(shopAlert, animated: true, completion: nil)
        }
        
        
        
        return shop.shopItem[sender.tag].itemName
        
    }
    
}
