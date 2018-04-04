//
//  WeatherTableViewCell.swift
//  MVVM
//
//  Created by EthanLin on 2018/4/3.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    var timeUnitArray = [TimeUnit(timeUnit: "12 Hour", isSelected: false), TimeUnit(timeUnit: "24 Hour", isSelected: false)]
    var lengthUnitArray = [LengthUnit(lengthUnit: "Imperial", isSelected: false), LengthUnit(lengthUnit: "Metric", isSelected: false)]
    var tempUnitArray = [TempUnit(tempUnit: "Fahrenheit", isSelected: false),TempUnit(tempUnit: "Celcius", isSelected: false)]
    
    
    @IBOutlet weak var weekDayLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var windSpeedLabel: UILabel!
    

    func updateUI(index:IndexPath,model:WeatherData){
        
        let date = Date(timeIntervalSince1970: model.daily.data[index.row].time)
        //設定星期幾
        let weekDayFormatter = DateFormatter()
        weekDayFormatter.dateFormat = "eeee"
        let weekDay = weekDayFormatter.string(from:date)
        
        //設定月份及日期
        let monthDayFormatter = DateFormatter()
        monthDayFormatter.dateFormat = "MMMM d"
        let monthDay = monthDayFormatter.string(from: date)
        
        
        //處理選定的長度單位及溫度單位來進行控制
        if UserDefaults.standard.integer(forKey: "lengthChoice") == 0{
            //選到的是英制
            self.windSpeedLabel.text = "\(Int(model.daily.data[index.row].windSpeed))MPH"
        }else{
            //選到的是公制
             self.windSpeedLabel.text = "\(Float(model.daily.data[index.row].windSpeed * 1.6))KPH"
        }
        
        if UserDefaults.standard.integer(forKey: "tempChoice") == 0{
            //選到的是F
            self.tempLabel.text = "\(Int(model.daily.data[index.row].temperatureLow))ºF - \(Int(model.daily.data[index.row].temperatureHigh))ºF"
        }else{
            //選到的是C
            self.tempLabel.text = "\(Int(((model.daily.data[index.row].temperatureLow)-32) * 5/9))ºC - \(Int(((model.daily.data[index.row].temperatureLow)-32) * 5/9))ºC"
        }
        
        self.weekDayLabel.text = weekDay
        self.dayLabel.text = monthDay
        
        
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
