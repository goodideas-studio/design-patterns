//
//  ViewController.swift
//  hugh
//
//  Created by Andy Tsai on 2018/4/2.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    var unitConverters: [UnitConverter]?
    var dataBlocks = [DataBlock]()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let defaults = UserDefaults.standard.value(forKey: "SettingGroups") as? Data {
            let settingGroups = NSKeyedUnarchiver.unarchiveObject(with: defaults) as! [SettingGroup]
            unitConverters = settingGroups.filter { settingGroup in
                return settingGroup.selectedIndexPath != nil
            }.map { settingGroup -> UnitConverter in
                return settingGroup.unitConverters[settingGroup.selectedIndexPath!.row]
            }
        }

        URLSession.shared.dataTask(with: URL(string: "https://api.darksky.net/forecast/558e1e2b1e0b1a7c3161b157338d77e1/23.5,120")!) { data, response, error in
            do {
                guard let data = data else {
                    return
                }
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary else {
                    return
                }
                if let dailyDataBlocks = json.value(forKeyPath: "daily.data") as? [NSDictionary] {
                    self.dataBlocks = dailyDataBlocks.map { dictionary -> DataBlock in
                        return DataBlock(dictionary: dictionary)
                    }

                    DispatchQueue.main.async { () -> Void in
                        self.dataBlocks = self.dataBlocks.map { dataBlock -> DataBlock in
                            var newDataBlock = dataBlock

                            self.unitConverters?.forEach { converter in
                                newDataBlock = converter.convert(newDataBlock)
                            }

                            return newDataBlock
                        }

                        self.tableView.reloadData()
                    }
                }
            } catch let error as NSError {
                print(error.debugDescription)
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBlocks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.dataBlock = dataBlocks[indexPath.row]
        return cell
    }
}
