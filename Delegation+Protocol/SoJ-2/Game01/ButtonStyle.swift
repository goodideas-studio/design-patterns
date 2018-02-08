//
//  ButtonStyle.swift
//  Game01
//
//  Created by 高菘駿 on 2018/2/8.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class ButtonStyle: UIButton {
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.red
        self.tintColor = UIColor.white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 20)
    }
    
}
