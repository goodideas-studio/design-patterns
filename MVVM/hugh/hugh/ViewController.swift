//
//  ViewController.swift
//  hugh
//
//  Created by Andy Tsai on 2018/4/2.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//

import UIKit

class SettingGroup {
    var titles: [String]
    
    var selectedTitle: String?
    
    init(titles: [String]) {
        self.titles = titles
    }
    
    func select(_ indexPath: IndexPath) {
        self.selectedTitle = titles[indexPath.row]
    }
    
    func cell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        cell.textLabel?.text = titles[indexPath.row]
        cell.accessoryType = titles[indexPath.row] == selectedTitle ? .checkmark : .none
        
        
        return cell
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var settingGroups = [
        SettingGroup(titles: ["12 Hour", "24 Hour"]),
        SettingGroup(titles: ["Imperial", "Metric"]),
        SettingGroup(titles: ["Fahrenheit", "Celcius"]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = settingGroups[indexPath.section].cell(tableView, indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        settingGroups[indexPath.section].select(indexPath)
        tableView.reloadData()
    }
}

