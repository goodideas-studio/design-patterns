//
//  SecondViewController.swift
//  Singleton_Game
//
//  Created by 唐嘉伶 on 26/02/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class PackViewController: UIViewController {
    
//  var itemsInMyPack = [String]()
    
    
  @IBOutlet weak var totalAsset: UILabel!
  @IBOutlet weak var totalItems: UILabel!
  @IBOutlet weak var packItemsCollection: UICollectionView!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  
    packItemsCollection.delegate = self
    packItemsCollection.dataSource = self
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    
    totalAsset.text = String(Asset.shared.totalAsset)
    totalItems.text = String(itemInPack.count)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
}


// extension PackViewController to be delegate & datasrc of collectionView
extension PackViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    itemInPack.remove(at: indexPath.item)
    self.packItemsCollection.reloadData()
  }
}

extension PackViewController: UICollectionViewDataSource {
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    return itemInPack.count
  }
    
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PackItemCell", for: indexPath) as! PackCollectionViewCell
    cell.itemInPackPic.image = itemInPack[indexPath.item].potionImg
    cell.itemInPackPowerVal.text = String(itemInPack[indexPath.item].powerValue)
    return cell
  }
    
}



