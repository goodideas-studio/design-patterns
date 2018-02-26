//
//  ShopCollectionViewController.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
let shop = Shop()

protocol ShopItemDelegate {
    func getItem(itemName:String)
}

class ShopCollectionViewController: UICollectionViewController {

    let fullsize = UIScreen.main.bounds.size
    var itemDelegate:ShopItemDelegate?
    
    
    
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet weak var myLayout: UICollectionViewFlowLayout!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLayout.itemSize = CGSize(width: 150, height: 150 )
        myLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        myLayout.minimumLineSpacing = 10
            
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        
        
        return shop.shopItem.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ShopItemCell
        
        let shopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        shopButton.tag = indexPath.row
        shopButton.setImage(UIImage(named: shop.shopItem[indexPath.row]), for: .normal)
        shopButton.addTarget(self, action: #selector(showShopAlert), for: UIControlEvents.touchUpInside)
        
        cell.addSubview(shopButton)
        
//        cell.ItemImage.image = UIImage(named: shop.shopItem[indexPath.row])
//        cell.ItemImage.contentMode = .scaleAspectFit

       return cell
    }
    
    @objc func showShopAlert(sender:UIButton) -> String{
//        print(shop.shopItem[sender.tag])
        
        let shopAlert = UIAlertController(title: "Check", message: "確認要購買？", preferredStyle: UIAlertControllerStyle.alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (finish) in
            print("取消購買")
            
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (finish) in
            print("確認購買")
            shop.shopItem.remove(at: sender.tag)
            self.myCollectionView.reloadData()
            
//            let notificationName = Notification.Name("BuyItem")
//            NotificationCenter.default.post(name: notificationName, object:nil , userInfo: nil)
            
        }
        
        shopAlert.addAction(cancelAction)
        shopAlert.addAction(okAction)
        
        self.present(shopAlert, animated: true, completion: nil)
        

        
        return shop.shopItem[sender.tag]
    }
    
    

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
