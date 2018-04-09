//
//  DailyCell.swift
//  SoJ
//
//  Created by 高菘駿 on 2018/4/9.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class DailyCell: UITableViewCell {

    @IBOutlet weak var weekDateLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
