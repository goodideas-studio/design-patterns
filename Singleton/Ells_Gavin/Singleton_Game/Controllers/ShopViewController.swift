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
       
        
        NotificationCenter.default.addObserver(self, selector: #selector(moneyRemainedInWallet(notification:)), name: .moneyDidSelect, object: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func moneyRemainedInWallet(notification: NSNotification) {
    NotificationCenter.default.post(name: .moneyDidSelect, object: moneyRemaining.text)
        
        var data = notification.object as! String
          moneyRemaining.text = data
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
