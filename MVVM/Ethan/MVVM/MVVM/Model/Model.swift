//
//  Model.swift
//  MVVM
//
//  Created by EthanLin on 2018/3/28.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import Foundation


class TimeUnit: NSObject{
    //var dd: [[String: Any]] = [["12HR": false], ["24HR": false]]
    var timeUnit:String //[String] = ["12HR", "24HR"]
    var isSelected:Bool //[Bool] = [false, false]
    
    init(timeUnit:String,isSelected:Bool) {
        self.timeUnit = timeUnit
        self.isSelected = isSelected
    }
//    required convenience init(coder aDecoder:NSCoder) {
//        let timeUnit = aDecoder.decodeObject(forKey: "timeUnit") as! String
//        let isSelected = aDecoder.decodeBool(forKey: "isSelected")
//        self.init(timeUnit: timeUnit, isSelected: isSelected)
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(timeUnit, forKey: "timeUnit")
//        aCoder.encode(isSelected, forKey: "isSelected")
//    }
}

class LengthUnit{
    var lengthUnit:String
    var isSelected:Bool
    init(lengthUnit:String,isSelected:Bool) {
        self.lengthUnit = lengthUnit
        self.isSelected = isSelected
    }
//    required convenience init(coder aDecoder:NSCoder) {
//        let lengthUnit = aDecoder.decodeObject(forKey: "lengthUnit") as! String
//        let isSelected = aDecoder.decodeBool(forKey: "isSelected")
//        self.init(lengthUnit: lengthUnit, isSelected: isSelected)
//    }
//
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(lengthUnit, forKey: "lengthUnit")
//        aCoder.encode(isSelected, forKey: "isSelected")
//    }
}

class TempUnit{
    var tempUnit:String
    var isSelected:Bool
    init(tempUnit:String,isSelected:Bool) {
        self.tempUnit = tempUnit
        self.isSelected = isSelected
    }
//    required convenience init(coder aDecoder:NSCoder) {
//        let tempUnit = aDecoder.decodeObject(forKey: "tempUnit") as! String
//        let isSelected = aDecoder.decodeBool(forKey: "isSelected")
//        self.init(tempUnit: tempUnit, isSelected: isSelected)
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(tempUnit, forKey: "tempUnit")
//        aCoder.encode(isSelected, forKey: "isSelected")
//    }
}
