//
//  ApiModel
//  MVVMpractice
//
//  Created by Morris on 2018/4/5.
//  Copyright © 2018年 Morris. All rights reserved.
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
