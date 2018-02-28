//
//  ShopViewController.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    
    // 創建 Shop 實例
    var shop = Shop()
    var shoppingCart:[Item] = []
    var total = 0
    
    
    
    
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
        messageView.alpha = 0
        moneyLabel.text = "\(Character.shared.dollars)"
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
        
        let shopButton = UIButton(frame: CGRect(x: 10, y: 10, width: 130, height: 130))
        shopButton.tag = indexPath.row
        shopButton.setImage(UIImage(named: shop.shopItem[indexPath.row].itemName), for: .normal)
        shopButton.addTarget(self, action: #selector(showShopAlert), for: UIControlEvents.touchUpInside)
        
        let selectedView = UIView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        selectedView.alpha = 1
        selectedView.backgroundColor = .white
        
        selectedView.addSubview(shopButton)
        cell.addSubview(selectedView)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.alpha = 1
        collectionView.cellForItem(at: indexPath)?.backgroundView?.backgroundColor = .blue
    }
    
    // Selector Cell按鈕方法
    @objc func showShopAlert(sender:UIButton){
        
        if Character.shared.dollars < shop.shopItem[sender.tag].dollars {
            
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
//            let shopAlert = UIAlertController(title: "購買視窗", message: "確認要購買？扣除 $\(self.shop.shopItem[sender.tag].dollars)", preferredStyle: UIAlertControllerStyle.alert)
//            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (finish) in
//                print("取消購買")
//            }
//
//            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (finish) in
//                Character.shared.dollars -= self.shop.shopItem[sender.tag].dollars
//                self.moneyLabel.text = "\(Character.shared.dollars)"
//
//                // tabbar 方式傳值到 PackViewController
//                if let packVC = self.tabBarController?.viewControllers![1] as? PackViewController {
//                    // 增加 ItemInPack
//                    packVC.ItemInPack.append(self.shop.shopItem[sender.tag])
//                    self.shop.shopItem.remove(at: sender.tag)
//                    self.shopCollectionView.reloadData()
//
//                    if self.shop.shopItem.isEmpty == true {
//                        self.messageView.alpha = 1
//                        self.messageView.text = "沒有物品"
//                    }
//                }
//            }
//
//
//            shopAlert.addAction(cancelAction)
//            shopAlert.addAction(okAction)
//
//
//            self.present(shopAlert, animated: true, completion: nil)
            
            // mode 2
            
            moneyLabel.text = "\(Character.shared.dollars)"
            shoppingCart.append(self.shop.shopItem[sender.tag])
            total += self.shop.shopItem[sender.tag].dollars

//            shop.shopItem.remove(at: sender.tag)
//            shopCollectionView.reloadData()

            
       }
    }
//

    @IBAction func buyButton(_ sender: UIButton) {
        
        
        
//        // mode 2
//        if let packVC = self.tabBarController?.viewControllers![1] as? PackViewController {
//            Character.shared.dollars -= self.total
//            packVC.ItemInPack = shoppingCart
//            shoppingCart = []
//        }
    }

}
