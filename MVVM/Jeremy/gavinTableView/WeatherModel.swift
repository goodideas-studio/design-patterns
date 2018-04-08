//
//  WeatherModel.swift
//  gavinTableView
//
//  Created by JeremyXue on 2018/4/2.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import Foundation

struct WeatherModel:Codable {
    var daily:Daily
    
    struct Daily:Codable {
        var data:[Data]
    }
    
    struct Data:Codable {
        var time:Date
        var windSpeed:Double
        var temperatureLow:Double
        var temperatureHigh:Double
        var icon:String 
    }
}



