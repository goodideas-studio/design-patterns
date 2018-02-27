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
    
    
    @IBOutlet weak var shopCollectionView: UICollectionView!
    @IBOutlet weak var shopLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // shop 排版
        shopLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        shopLayout.itemSize = CGSize(width: 150 , height: 150)
        shopLayout.minimumLineSpacing = CGFloat(integerLiteral: 10)
        shopLayout.minimumInteritemSpacing = CGFloat(integerLiteral: 10)
        
        shopCollectionView.dataSource = self
        shopCollectionView.delegate = self
        
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
        shopButton.setImage(UIImage(named: shop.shopItem[indexPath.row]), for: .normal)
        shopButton.addTarget(self, action: #selector(showShopAlert), for: UIControlEvents.touchUpInside)
        
        cell.addSubview(shopButton)
        
        return cell
        
        
    }
    
    @objc func showShopAlert(sender:UIButton) -> String{
        
        let shopAlert = UIAlertController(title: "Check", message: "確認要購買？", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (finish) in
            print("取消購買")
            
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (finish) in
            print("確認購買")
            
            
            // tabbar 方式傳值到 PackViewController
            if let packVC = self.tabBarController?.viewControllers![1] as? PackViewController {
                
                // 增加 ItemInPack
                packVC.ItemInPack.append(self.shop.shopItem[sender.tag])
                // 修改標題 物品數量
                packVC.itemCount.text = "ItemCount:\(packVC.ItemInPack.count)"
                packVC.packColletionView.reloadData()
            }
            
            self.shop.shopItem.remove(at: sender.tag)
            self.shopCollectionView.reloadData()
        }
        shopAlert.addAction(cancelAction)
        shopAlert.addAction(okAction)
        
        self.present(shopAlert, animated: true, completion: nil)
        return shop.shopItem[sender.tag]
        
    }
    
}
