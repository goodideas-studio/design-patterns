//
//  TableViewCell.swift
//  Game02
//
//  Created by 高菘駿 on 2018/2/12.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var gameNameLabel: UILabel!
    @IBOutlet var leftCharacterHP: UILabel!
    @IBOutlet var leftCharacterMP: UILabel!
    @IBOutlet var rightCharacterHP: UILabel!
    @IBOutlet var rightCharacterMP: UILabel!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var lossHP: UILabel!
    @IBOutlet var increaseHP: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
