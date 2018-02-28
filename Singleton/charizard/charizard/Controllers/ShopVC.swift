//
//  ShopVC.swift
//  charizard
//
//  Created by EthanLin on 2018/2/26.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class ShopVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var reminderLabel: UILabel!
    
    var shoppingItems: [Item] = [
        RedWater(name: "紅藥水", price: 100),
        RedWater(name: "紅藥水", price: 100),
        RedWater(name: "紅藥水", price: 100),
        RedWater(name: "紅藥水", price: 100),
        BlueWater(name: "藍藥水", price: 50),
        BlueWater(name: "藍藥水", price: 50),
        BlueWater(name: "藍藥水", price: 50),
        BlueWater(name: "藍藥水", price: 50),
        BlueWater(name: "藍藥水", price: 50)
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shoppingItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShoppingItemsCell
        
        shoppingItemCell.shoppingItemImageView.image = UIImage(named: shoppingItems[indexPath.row].name)
//        shoppingItemCell.shoppingItemNameLabel.text = shoppingItems[indexPath.row].name
        shoppingItemCell.shoppingItemPriceLabel.text = String(shoppingItems[indexPath.row].price)
        
        return shoppingItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if  GameManager.current.player!.balance < self.shoppingItems[indexPath.row].price{
            let alert = UIAlertController(title: "不夠錢買", message: "請努力賺錢", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        let ensurePurchaseAlert = UIAlertController(title: "確認購買\(shoppingItems[indexPath.row].name)?", message: "確認購買\(shoppingItems[indexPath.row].name)?", preferredStyle: .alert)
        let ensurePurchaseAction = UIAlertAction(title: "購買", style: .default) { (action) in
            if GameManager.current.player!.balance >= self.shoppingItems[indexPath.row].price {
                GameManager.current.player?.items.append(self.shoppingItems[indexPath.row])
                GameManager.current.player?.balance -= self.shoppingItems[indexPath.row].price
                self.navigationItem.title = "\(GameManager.current.player!.balance)"
                self.shoppingItems.remove(at: indexPath.row)
                self.shoppingItemCollectionView.reloadData()
                if self.shoppingItems.isEmpty{
                    self.shoppingItemCollectionView.isHidden = true
                    self.reminderLabel.text = "沒貨了喔"
                }
            }
        }
        let cancelPurchaseAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        ensurePurchaseAlert.addAction(ensurePurchaseAction)
        ensurePurchaseAlert.addAction(cancelPurchaseAction)
        present(ensurePurchaseAlert, animated: true, completion: nil)
    }
    

    @IBOutlet weak var shoppingItemCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingItemCollectionView.delegate = self
        shoppingItemCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "\(GameManager.current.player!.balance)"
        if shoppingItems.isEmpty {
            shoppingItemCollectionView.isHidden = true
            reminderLabel.text = "沒貨了喔"
        } else {
            shoppingItemCollectionView.isHidden = false
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
