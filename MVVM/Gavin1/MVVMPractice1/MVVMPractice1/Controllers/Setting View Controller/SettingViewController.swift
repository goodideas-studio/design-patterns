//
//  SettingViewController.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/29.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.

    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension SettingViewController: UITableViewDataSource {
  
  private enum Section: Int {
    case time
    case units
    case temperature
    
    var numberOfRows: Int {
      return 2
    }
    
    static var count: Int {
      return (Section.temperature.rawValue + 1)
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return Section.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    guard let section = Section(rawValue: section) else {
      fatalError("Unexpected Section")
    }
    return section.numberOfRows
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let section = Section(rawValue: indexPath.section) else {
      fatalError("Unexpected Section")
    }
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseIdentifier, for: indexPath) as? TableViewCell else {
      fatalError("Unexpected cell")
    }
    
    var viewModel: SettingsRepresentable?
    
    switch section {
    case .time:
      guard let timeNotation = TimeNotation(rawValue: indexPath.row) else {
        fatalError("Time Section: Unexpected Index Path")
      }
      
      viewModel = SettingsViewTimeViewModel(timeNotation: timeNotation)
      
    case .units:
      guard let unitsNotation = UnitsNotation(rawValue: indexPath.row) else {
        fatalError("Units Section: Unexpected Index Path")
      }
      
      viewModel = SettingsViewUnitsViewModel(unitsNotation: unitsNotation)
      
    case .temperature:
      guard let temperatureNotation = TemperatureNotation(rawValue: indexPath.row) else {
        fatalError("Temperature Section: Unexpected Index Path")
      }
      
      viewModel = SettingsViewTemperatureViewModel(temperatureNotation: temperatureNotation)
    }
    
    if let viewModel = viewModel {
      cell.configure(withViewModel: viewModel)
    }
    
    return cell
  }
}

extension SettingViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    guard let section = Section(rawValue: indexPath.section) else {
      fatalError("Unexpected Section")
    }
    
    switch section {
    case .time:
      let timeNotation = UserDefaults.timeNotation()
      guard indexPath.row != timeNotation.rawValue else {
        return
      }
      
      if let newTimeNotation = TimeNotation(rawValue: indexPath.row) {
        // Update User Defaults
        UserDefaults.setTimeNotation(timeNotation: newTimeNotation)
      }
      
    case .units:
      let unitsNotation = UserDefaults.unitsNotation()
      guard indexPath.row != unitsNotation.rawValue else {
        return
      }
      
      if let newUnitsNotation = UnitsNotation(rawValue: indexPath.row) {
        // Update User Defaults
        UserDefaults.setUnitsNotation(unitNotation: newUnitsNotation)
      }
      
    case .temperature:
      let temperatureNotation = UserDefaults.temperatureNotation()
      guard indexPath.row != temperatureNotation.rawValue else { return }
      
      if let newTemperatureNotation = TemperatureNotation(rawValue: indexPath.row) {
        // Update User Defaults
        UserDefaults.setTemperatureNotation(temperatureNotation: newTemperatureNotation)
      }
    }
    
    tableView.reloadSections(IndexSet(integer: indexPath.section), with: .none)
  }
}
