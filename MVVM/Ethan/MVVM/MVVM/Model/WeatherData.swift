//
//  WeatherData.swift
//  MVVM
//
//  Created by EthanLin on 2018/4/3.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation


struct WeatherData: Codable {
    var daily: DayData
}

struct DayData: Codable {
    var summary: String
    var icon: String
    var data: [Data]
}

struct Data: Codable {
    var time: Double
    var icon: String
    var temperatureHigh: Double
    var temperatureLow: Double
    var windSpeed: Double
}
