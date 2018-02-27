//
//  ShopViewController.swift
//  Singleton_Game
//
//  Created by 唐嘉伶 on 26/02/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    var itemsInShop = [String]()
    
    @IBOutlet weak var shopItemCollection: UICollectionView!
    
    @IBOutlet weak var moneyRemaining: UILabel!
    
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
        
    }
    
}




extension ShopViewController: UICollectionViewDelegate {
    
}

extension ShopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemsInShop.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CellAtShop
        
        return cell
    }
}
