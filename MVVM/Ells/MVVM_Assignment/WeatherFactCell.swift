//
//  WeatherFactCell.swift
//  MVVM_Assignment
//
//  Created by 唐嘉伶 on 02/04/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class WeatherFactCell: UITableViewCell {

  @IBOutlet weak var weekdayLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var windSpeedLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
