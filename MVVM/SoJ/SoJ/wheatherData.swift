//
//  wheatherData.swift
//  SoJ
//
//  Created by 高菘駿 on 2018/4/9.
//  Copyright © 2018年 SoJ. All rights reserved.
//

import Foundation

struct AllData:Codable{
    var daily:DayData
}

struct DayData:Codable{
    var data:[DailyDetailData]
}


struct DailyDetailData:Codable{
    var time:Double
    var icon:String
    var temperatureHigh:Double
    var temperatureLow:Double
    var windSpeed:Double
    
    
}
