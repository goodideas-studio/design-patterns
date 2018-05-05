//
//  TouchViewController.swift
//  ResponderChain
//
//  Created by JeremyXue on 2018/4/30.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class TouchViewController: UIViewController {

    
    @IBOutlet weak var blockView: UIView!
    @IBOutlet weak var buttonView: UIView!
    
    @IBAction func printMessage(_ sender: UIButton) {
        print("ClickClickClickClick")
    }
    
    @IBAction func alphaControl(_ sender: UIBarButtonItem) {
        if buttonView.alpha == 1 {
            UIView.animate(withDuration: 1, animations: {
                self.buttonView.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.buttonView.alpha = 1
            })
        }
    }
    
    @IBAction func hiddenControl(_ sender: UIBarButtonItem) {
        buttonView.isHidden = !buttonView.isHidden
    }
    
    @IBAction func block(_ sender: Any) {
        blockView.isHidden = !blockView.isHidden
    }
    
    @IBAction func interfaceEnableControl(_ sender: UIBarButtonItem) {
        buttonView.isUserInteractionEnabled = !buttonView.isUserInteractionEnabled
        
    }
    
    @IBAction func animationControl(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0, options: [UIViewAnimationOptions.autoreverse,.repeat,.allowUserInteraction], animations: {
            self.buttonView.center.y += 200
        }, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
