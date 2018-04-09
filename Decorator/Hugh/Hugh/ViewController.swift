//
//  ViewController.swift
//  Hugh
//
//  Created by Andy Tsai on 2018/4/9.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//

import UIKit

extension UIColor {
    func decorate(_ baseColor: UIColor) -> UIColor {
        var currentR: CGFloat = 0
        var currentG: CGFloat = 0
        var currentB: CGFloat = 0
        var currentA: CGFloat = 0
        
        self.getRed(&currentR, green: &currentG, blue: &currentB, alpha: &currentA)
        
        var baseR: CGFloat = 0
        var baseG: CGFloat = 0
        var baseB: CGFloat = 0
        var baseA: CGFloat = 0
        
        baseColor.getRed(&baseR, green: &baseG, blue: &baseB, alpha: &baseA)
        
        return UIColor(red: (currentR + baseR) / 2, green: (currentG + baseG) / 2, blue: (currentB + baseB) / 2, alpha: (currentA + baseA) / 2)
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red.decorate(
            UIColor.blue.withAlphaComponent(0.5)
        ).decorate(.yellow)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

