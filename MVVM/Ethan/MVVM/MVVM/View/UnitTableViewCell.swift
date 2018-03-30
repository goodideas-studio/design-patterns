//
//  UnitTableViewCell.swift
//  MVVM
//
//  Created by EthanLin on 2018/3/28.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class UnitTableViewCell: UITableViewCell {

    func updateTimeUI(model:TimeUnit){
        self.textLabel?.text = model.timeUnit
        if model.isSelected == true{
            self.accessoryType = .checkmark
        }else{
            self.accessoryType = .none
        }
    }
    
    func updateLengthUI(model:LengthUnit){
        self.textLabel?.text = model.lengthUnit
        if model.isSelected == true{
            self.accessoryType = .checkmark
        }else{
            self.accessoryType = .none
        }
    }
    
    func updateTempUI(model:TempUnit){
        self.textLabel?.text = model.tempUnit
        if model.isSelected == true{
            self.accessoryType = .checkmark
        }else{
            self.accessoryType = .none
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
