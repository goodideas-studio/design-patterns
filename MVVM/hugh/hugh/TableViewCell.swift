//
//  TableViewCell.swift
//  hugh
//
//  Created by Andy Tsai on 2018/4/11.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var weekdayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    var dataBlock: DataBlock? {
        didSet {
            if let dataBlock = dataBlock {
                let date = Date(timeIntervalSince1970: TimeInterval(dataBlock.time))
                
                weekdayLabel.text = "\(Calendar.current.weekdaySymbols[Calendar.current.component(.weekday, from: date) - 1])"
                dateLabel.text = "\(Calendar.current.monthSymbols[Calendar.current.component(.month, from: date) - 1]) \(Calendar.current.component(.day, from: date))"
                temperatureLabel.text = "\(dataBlock.temperatureLow) - \(dataBlock.temperatureHigh) \(dataBlock.temperatureUnit)"
                windSpeedLabel.text = "\(dataBlock.windSpeed) \(dataBlock.windSpeedUnit)"
            } else {
                weekdayLabel.text = nil
                dateLabel.text = nil
                temperatureLabel.text = nil
                windSpeedLabel.text = nil
            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
