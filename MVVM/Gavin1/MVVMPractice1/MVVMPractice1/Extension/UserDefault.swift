//
//  UserDefault.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/29.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

enum TimeNotation: Int {
  case twelveHour
  case twentyFourHour
}

enum UnitsNotation: Int {
  case imperial
  case metric
}

enum TemperatureNotation: Int {
  case fahrenheit
  case celsius
}

extension UserDefaults {
  
  enum Keys {
    static let locations = "locations"
    static let timeNotation = "timeNotation"
    static let unitsNotation = "unitsNotation"
    static let temperatureNotation = "temperatureNotation"
  }
  
  // MARK: - Time Notation
  static func timeNotation() -> TimeNotation {
    let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.timeNotation)
    return TimeNotation(rawValue: storedValue) ?? TimeNotation.twelveHour
  }
  
  static func setTimeNotation(timeNotation: TimeNotation) {
    UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaults.Keys.timeNotation)
  }
  
  // MARK: - Units Notation
  static func unitsNotation() -> UnitsNotation {
    let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.unitsNotation)
    return UnitsNotation(rawValue: storedValue) ?? UnitsNotation.imperial
  }
  
  static func setUnitsNotation(unitNotation: UnitsNotation) {
    UserDefaults.standard.set(unitNotation.rawValue, forKey: UserDefaults.Keys.unitsNotation)
  }
  
  // MARK: - Temperature Notation
  static func temperatureNotation() -> TemperatureNotation {
    let storedValue = UserDefaults.standard.integer(forKey: UserDefaults.Keys.temperatureNotation)
    return TemperatureNotation(rawValue: storedValue) ?? TemperatureNotation.fahrenheit
  }
  
  static func setTemperatureNotation(temperatureNotation: TemperatureNotation) {
    UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaults.Keys.temperatureNotation)
  }
}
