//
//  WeatherViewController.swift
//  MVVM
//
//  Created by EthanLin on 2018/4/3.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    
    @IBAction func settingAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goUnit", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
