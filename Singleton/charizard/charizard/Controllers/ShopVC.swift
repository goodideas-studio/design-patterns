//
//  ShopVC.swift
//  charizard
//
//  Created by EthanLin on 2018/2/26.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

//class RedWater:Item{
//    
//    var name: String
//    
//    var price: Int
//    
//    init(name:String, price:Int) {
//        self.name = name
//        self.price = price
//    }
//    
//    func apply(character: Character) {
//        character.HP += 10
//    }
//    
//}
//
//class BlueWater:Item{
//    var name: String
//    
//    var price: Int
//    
//    init(name:String, price:Int) {
//        self.name = name
//        self.price = price
//    }
//    
//    func apply(character: Character) {
//        character.MP += 5
//    }
//    
//}

class ShopVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
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
        
        shoppingItemCell.shoppingItemNameLabel.text = shoppingItems[indexPath.row].name
        shoppingItemCell.shoppingItemPriceLabel.text = String(shoppingItems[indexPath.row].price)
        
        return shoppingItemCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if GameManager.current.player!.balance >= shoppingItems[indexPath.row].price {
            GameManager.current.player?.items.append(shoppingItems[indexPath.row])
            GameManager.current.player?.balance -= shoppingItems[indexPath.row].price
            title = "\(GameManager.current.player!.balance)"
            shoppingItems.remove(at: indexPath.row)
            shoppingItemCollectionView.reloadData()
        } else {
            let alert = UIAlertController(title: "不夠錢買", message: "請努力賺錢", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
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
        title = "\(GameManager.current.player!.balance)"
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
