//
//  Model.swift
//  MVVM_Assignment
//
//  Created by 唐嘉伶 on 30/03/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import Foundation

var rowInSectionOne = ["12 Hour", "24 Hour"]
var rowInSectionTwo = ["Imperial", "Metrics"]
var rowInSectionThree = ["F", "C"]

var sections = [0: rowInSectionOne, 1: rowInSectionTwo, 2: rowInSectionThree]

var selectedRowsInsections: [[Bool]] = [[true, false], [true, false], [true, false]]
var storeArray = [[Bool]]()
var pickedRows: [Int] = [0, 0, 0]


var darkSkyAPI_Prefix = "https://api.darksky.net/forecast/1fa5d253522d32733acb1ebcdb58c1dc/"
var location_API_Suffix = ""
var darkSkyAPIKey = ""
