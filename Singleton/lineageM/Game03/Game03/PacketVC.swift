//
//  packetVC.swift
//  Game03
//
//  Created by 高菘駿 on 2018/2/26.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

protocol useItemDelegate {
    func useItem(itemName: String)
}

class PacketVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet var itemNumbersLabel: UILabel!
    @IBOutlet var backpackCollectionView: UICollectionView!
    
    var delegate: useItemDelegate?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Backpack.current.backpackItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "backpackCell", for: indexPath) as! BackpackCell
        cell.backpackItemImageView.image = UIImage(named: Backpack.current.backpackItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "使用道具", message: "確定使用\(Backpack.current.backpackItems[indexPath.row])？", preferredStyle: .alert)
        alert.addAction(
            UIAlertAction(title: "好", style: UIAlertActionStyle.default, handler: { _ in
            self.delegate?.useItem(itemName: Backpack.current.backpackItems[indexPath.row])
            //print(indexPath)
            Backpack.current.useItems(itemLocation: indexPath.row)
            self.itemNumbersLabel.text = "Item: \(Backpack.current.backpackItems.count) 個"
            self.backpackCollectionView.reloadData()
        }))
        
        alert.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.default, handler: { _ in
        }))
        present(alert, animated: true)
        
        //print("\(indexPath)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        itemNumbersLabel.text = "Item: \(Backpack.current.backpackItems.count) 個"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        backpackCollectionView.reloadData()
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
