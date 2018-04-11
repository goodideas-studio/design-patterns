//
//  ViewController.swift
//  hugh
//
//  Created by Andy Tsai on 2018/4/2.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//
import UIKit

struct DataBlock {
    var time: Int
    var temperatureLow: Double
    var temperatureHigh: Double
    var windSpeed: Double
    var temperatureUnit: String
    var windSpeedUnit: String
}

extension DataBlock {
    init(dictionary: NSDictionary) {
        self.init(time: dictionary["time"] as! Int, temperatureLow: dictionary["temperatureLow"] as! Double, temperatureHigh: dictionary["temperatureHigh"] as! Double, windSpeed: dictionary["windSpeed"] as! Double, temperatureUnit: "°F", windSpeedUnit: "KPH")
    }
}

class UnitConverter: NSObject, NSCoding {
    func convert(_ dataBlock: DataBlock) -> DataBlock {
        fatalError("bla bla bla")
    }

    override init() {
        super.init()
    }

    func encode(with aCoder: NSCoder) {}

    required init?(coder aDecoder: NSCoder) {}
}

class NilUnitConverter: UnitConverter {
    override func convert(_ dataBlock: DataBlock) -> DataBlock {
        return dataBlock
    }
}

class MetricUnitConverter: UnitConverter {
    override func convert(_ dataBlock: DataBlock) -> DataBlock {
        return DataBlock(time: dataBlock.time, temperatureLow: dataBlock.temperatureLow, temperatureHigh: dataBlock.temperatureHigh, windSpeed: dataBlock.windSpeed * 0.27, temperatureUnit: dataBlock.temperatureUnit, windSpeedUnit: "m/s")
    }
}

class CelciusUnitConverter: UnitConverter {
    override func convert(_ dataBlock: DataBlock) -> DataBlock {
        return DataBlock(time: dataBlock.time, temperatureLow: round((dataBlock.temperatureLow - 32) / 1.8), temperatureHigh: round((dataBlock.temperatureHigh - 32) / 1.8), windSpeed: dataBlock.windSpeed, temperatureUnit: "°C", windSpeedUnit: dataBlock.windSpeedUnit)
    }
}

class SettingGroup: NSObject, NSCoding {
    var group: String
    var titles: [String]
    var unitConverters: [UnitConverter]
    var selectedIndexPath: IndexPath?

    init(group: String, titles: [String], unitConverters: [UnitConverter]) {
        self.group = group
        self.titles = titles
        self.unitConverters = unitConverters
    }

    func select(_ indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }

    func cell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = titles[indexPath.row]
        cell.accessoryType = indexPath == selectedIndexPath ? .checkmark : .none
        return cell
    }

    func encode(with coder: NSCoder) {
        coder.encode(group, forKey: "group")
        coder.encode(titles, forKey: "titles")
        coder.encode(unitConverters, forKey: "unitConverters")
        coder.encode(selectedIndexPath, forKey: "selectedIndexPath")
    }

    required init?(coder decoder: NSCoder) {
        group = decoder.decodeObject(forKey: "group") as! String
        titles = decoder.decodeObject(forKey: "titles") as! [String]
        unitConverters = decoder.decodeObject(forKey: "unitConverters") as! [UnitConverter]
        selectedIndexPath = decoder.decodeObject(forKey: "selectedIndexPath") as? IndexPath
    }
}

class SettingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var settingGroups = [
        SettingGroup(group: "Imperial or Metric", titles: ["Imperial", "Metric"], unitConverters: [
            NilUnitConverter(), MetricUnitConverter()
        ]),
        SettingGroup(group: "Fahrenheit or Celcius", titles: ["Fahrenheit", "Celcius"], unitConverters: [
            NilUnitConverter(), CelciusUnitConverter()
        ])
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        if let defaults = UserDefaults.standard.value(forKey: "SettingGroups") as? Data {
            settingGroups = NSKeyedUnarchiver.unarchiveObject(with: defaults) as! [SettingGroup]
        }
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingGroups.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingGroups[section].titles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingGroups[indexPath.section].cell(tableView, indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settingGroups[indexPath.section].select(indexPath)
        UserDefaults.standard.set(
            NSKeyedArchiver.archivedData(withRootObject: settingGroups),
            forKey: "SettingGroups"
        )
        tableView.reloadData()
    }
}

