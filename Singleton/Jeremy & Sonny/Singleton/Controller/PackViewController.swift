//
//  SecondViewController.swift
//  Singleton
//
//  Created by JeremyXue on 2018/2/26.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit


class PackViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    @IBOutlet weak var packLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var packColletionView: UICollectionView!
    
    // Pack 數組，接收商店購買物品
    var ItemInPack = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        packLayout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        packLayout.itemSize = CGSize(width: 150 , height: 150)
        packLayout.minimumLineSpacing = CGFloat(integerLiteral: 10)
        packLayout.minimumInteritemSpacing = CGFloat(integerLiteral: 10)
        
        packColletionView.dataSource = self
        packColletionView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        print(ItemInPack)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 遵循 Collection View 協定方式
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return ItemInPack.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "itemCell", for: indexPath)
        
        let packButton = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        packButton.tag = indexPath.row
        packButton.setImage(UIImage(named: ItemInPack[indexPath.row]), for: .normal)
        packButton.addTarget(self, action: #selector(showPackAlert), for: UIControlEvents.touchUpInside)
        
        cell.addSubview(packButton)
        
        return cell
    }
    
    @objc func showPackAlert(sender:UIButton) -> String{

        let packAlert = UIAlertController(title: "Check", message: "確認要使用？", preferredStyle: UIAlertControllerStyle.alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (finish) in
            print("取消使用")

        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel) { (finish) in
            print("確認使用")

            self.ItemInPack.remove(at: sender.tag)
            self.packColletionView.reloadData()
        }
        packAlert.addAction(cancelAction)
        packAlert.addAction(okAction)

        self.present(packAlert, animated: true, completion: nil)
        return ItemInPack[sender.tag]

    }

}


