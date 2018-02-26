//
//  SecondViewController.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit


class PackViewController: UIViewController, ShopItemDelegate {
    
    @IBOutlet weak var itemCount: UILabel!
    
    
    
    
    
    func getItem(itemName: String) {
        print("getItem")
        if let shopVC = tabBarController?.viewControllers![2] as? ShopCollectionViewController{
            shopVC.itemDelegate = self
            itemCount.text = itemName
        }
        
        
    }
    

    
    var addItemFromShop:String?
    var packItem = [String]()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(packItem)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
