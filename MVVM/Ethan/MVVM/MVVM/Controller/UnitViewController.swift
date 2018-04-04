//
//  ViewController.swift
//  MVVM
//
//  Created by EthanLin on 2018/3/28.
//  Copyright © 2018年 EthanLin. All rights reserved.
//

import UIKit


class UnitViewController: UIViewController {
    
    
    @IBAction func saveDoneAction(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    var timeUnitArray = [TimeUnit(timeUnit: "12 Hour", isSelected: false), TimeUnit(timeUnit: "24 Hour", isSelected: false)]
    var lengthUnitArray = [LengthUnit(lengthUnit: "Imperial", isSelected: false), LengthUnit(lengthUnit: "Metric", isSelected: false)]
    var tempUnitArray = [TempUnit(tempUnit: "Fahrenheit", isSelected: false),TempUnit(tempUnit: "Celcius", isSelected: false)]
    
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.isScrollEnabled = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        timeUnitArray[UserDefaults.standard.integer(forKey: "timeChoice")].isSelected = true
        lengthUnitArray[UserDefaults.standard.integer(forKey: "lengthChoice")].isSelected = true
        tempUnitArray[UserDefaults.standard.integer(forKey: "tempChoice")].isSelected = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension UnitViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        
        switch indexPath.section {
        case 0:
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UnitTableViewCell
            cell.updateTimeUI(model: timeUnitArray[indexPath.row])
            return cell
        case 1:
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UnitTableViewCell
            cell.updateLengthUI(model:lengthUnitArray[indexPath.row])
            return cell
        default:
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UnitTableViewCell
            cell.updateTempUI(model: tempUnitArray[indexPath.row])
            return cell
        }

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        
        switch indexPath.section {
        case 0:
            for item in timeUnitArray{
                item.isSelected = false
            }
            timeUnitArray[indexPath.row].isSelected = true
            UserDefaults.standard.set(indexPath.row, forKey: "timeChoice")
            
        case 1:
            for item in lengthUnitArray{
                item.isSelected = false
            }
            lengthUnitArray[indexPath.row].isSelected = true
            UserDefaults.standard.set(indexPath.row, forKey: "lengthChoice")
            
        default:
            for item in tempUnitArray{
                item.isSelected = false
            }
            tempUnitArray[indexPath.row].isSelected = true
            UserDefaults.standard.set(indexPath.row, forKey: "tempChoice")
        }
        self.tableview.reloadData()
    }
}
