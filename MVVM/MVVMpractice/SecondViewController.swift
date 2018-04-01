//
//  SecondViewController.swift
//  MVVMpractice
//
//  Created by Morris on 2018/3/29.
//  Copyright © 2018年 Morris. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var hourDefault = UserDefaults.standard.array(forKey: "section1") as! [Int]
    var unitDefault = UserDefaults.standard.array(forKey: "section2") as! [Int]
    var tempDefault = UserDefaults.standard.array(forKey: "section3") as! [Int]
    
    let defaults = UserDefaults.standard
    
//    var checkersOpFalse = [IndexPath: Bool]()
    @IBAction func buttonPressed(_ sender: UIBarButtonItem) {
    }
    
    let hourSection = [
        "12 Hour",
        "24 Hour"]
    
    let unitSection = [
        "Imperial",
        "Metric"]
    
    let tempSection = [
        "Fahrenheit",
        "Celcius"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0{
            return hourSection.count
        }else if section == 1{
            return unitSection.count
        }else{
            return tempSection.count
        }
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

//        tableView.deselectRow(at: indexPath, animated: false)
//        checkersOpFalse[indexPath] = !checkersOpFalse[indexPath, default: false]
  
        if indexPath == [0,0]{
            tableView.cellForRow(at: [0,0])?.accessoryType = .checkmark
            tableView.cellForRow(at: [0,1])?.accessoryType = .none

        }
        if indexPath == [0,1]{
            tableView.cellForRow(at: [0,1])?.accessoryType = .checkmark
            tableView.cellForRow(at: [0,0])?.accessoryType = .none

        }
        if indexPath == [1,0]{
            tableView.cellForRow(at: [1,0])?.accessoryType = .checkmark
            tableView.cellForRow(at: [1,1])?.accessoryType = .none
        }
        if indexPath == [1,1]{
            tableView.cellForRow(at: [1,1])?.accessoryType = .checkmark
            tableView.cellForRow(at: [1,0])?.accessoryType = .none

        }
        if indexPath == [2,0]{
            tableView.cellForRow(at: [2,0])?.accessoryType = .checkmark
            tableView.cellForRow(at: [2,1])?.accessoryType = .none

        }
        if indexPath == [2,1]{
            tableView.cellForRow(at: [2,1])?.accessoryType = .checkmark
            tableView.cellForRow(at: [2,0])?.accessoryType = .none
        }
    
        if indexPath.section == 0{
            defaults.set([indexPath.section,indexPath.row], forKey: "section1")
            print(defaults.array(forKey: "section1") as! [Int])
        }
        if indexPath.section == 1{
            defaults.set([indexPath.section,indexPath.row], forKey: "section2")
            print(defaults.array(forKey: "section2") as! [Int])
        }
        if indexPath.section == 2{
            defaults.set([indexPath.section,indexPath.row], forKey: "section3")
            print(defaults.array(forKey: "section3") as! [Int])
        }
        tableView.reloadRows(at: [indexPath], with: .fade)
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .default
        
        
        if indexPath == [hourDefault[0],hourDefault[1]]{
            cell.accessoryType = .checkmark
        }
        if indexPath == [unitDefault[0],unitDefault[1]]{
            cell.accessoryType = .checkmark
        }
        if indexPath == [tempDefault[0],tempDefault[1]]{
            cell.accessoryType = .checkmark
        }
//        cell.accessoryType = checkersOpFalse[indexPath, default: false] ? .checkmark : .none
        if indexPath.section == 0{
            cell.textLabel?.text = hourSection[indexPath.row]
        }else if indexPath.section == 1{
            cell.textLabel?.text = unitSection[indexPath.row]
        }else if indexPath.section == 2{
            cell.textLabel?.text = tempSection[indexPath.row]
        }
        return cell
        
    }
    



    override func viewDidLoad() {
        super.viewDidLoad()
        }
    
        
    //to fix: tableview cell react very slow when I click it!
    //to fix: checkmark disappear when first click
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
