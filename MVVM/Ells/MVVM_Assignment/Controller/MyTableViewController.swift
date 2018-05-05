//
//  MyTableViewController.swift
//  MVVM_Assignment
//
//  Created by 唐嘉伶 on 30/03/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {

  @IBOutlet var myTableView: UITableView!
  
  @IBOutlet weak var deonSettingBtn: UIBarButtonItem!
  
  let userdefaults = UserDefaults.standard

  var selectedIndexPath = [Int: Int]()

  //var selectedIndexPath
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    myTableView.reloadData()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
  
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (sections[section]?.count)!
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyCell
    cell.textLabel?.text = sections[indexPath.section]?[indexPath.row]
    
    let selectionStored = userdefaults.array(forKey: "picked")
    print(selectionStored)
    cell.accessoryType = storeArray[indexPath.section][indexPath.row] ? .checkmark: .none
    //    cell.isSelected = selectedRowsInsections[indexPath.section][indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    //if selectedRowsInsections[indexPath.section][indexPath.row] {
    for i in 0..<selectedRowsInsections[indexPath.section].count {
      // lets set all cell in selectedRowsInsections to be false for now
      selectedRowsInsections[indexPath.section][i] = false
      let cell = myTableView.cellForRow(at: [indexPath.section, i])
      cell?.accessoryType = .none
    }
    
    // make the selected cell in selectedRowsInsections to be true again
    selectedRowsInsections[indexPath.section][indexPath.row] = true
    myTableView.cellForRow(at: indexPath)?.accessoryType = selectedRowsInsections[indexPath.section][indexPath.row] ? .checkmark: .none
    
    userdefaults.set(selectedRowsInsections, forKey: "picked")
    storeArray = (userdefaults.array(forKey: "picked") as? [[Bool]])!
    
    print(indexPath)
    print(storeArray)
    //}

  }
  
  
  @IBAction func doneSetting(_ sender: UIBarButtonItem) {
    performSegue(withIdentifier: "goWeatherFactVC", sender: nil)
    
  }
  
    
}




