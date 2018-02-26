//
//  SecondViewController.swift
//  Singleton_Game
//
//  Created by 唐嘉伶 on 26/02/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class PackViewController: UIViewController {
    
    var itemsInMyPack = [String]()
    
    

<<<<<<< Updated upstream
    @IBOutlet weak var packItemsCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
=======
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
  }
>>>>>>> Stashed changes

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

extension PackViewController: UICollectionViewDelegate {
    
}

extension PackViewController: UICollectionViewDataSource {
    
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
    return itemsInMyPack.count
  }
    
    
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellOne", for: indexPath) as! CellInMyBackPack
        
    return cell
  }
    
}



