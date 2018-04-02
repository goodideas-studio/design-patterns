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

    myTableView.allowsMultipleSelection = true

    // self.clearsSelectionOnViewWillAppear = false
    self.navigationItem.rightBarButtonItem = self.editButtonItem
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

 
  override func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
    
//  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//      let myView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.lightGray
//      view.translatesAutoresizingMaskIntoConstraints = false
//        view.frame.size.height = 80
//
//        return view
//      }()
//      return myView
//  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return (sections[section]?.count)!
  }
    
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyCell
    cell.textLabel?.text = sections[indexPath.section]?[indexPath.row]
    cell.accessoryType = .none
    
    cell.isSelected = false
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    
    selectedIndexPath = [(myTableView.indexPathForSelectedRow?.section)!: (myTableView.indexPathForSelectedRow?.row)!]
    
    if selectedRowsInsections[indexPath.section][indexPath.row] {
      for i in 0..<selectedRowsInsections[indexPath.section].count {
        selectedRowsInsections[indexPath.section][indexPath.row] = false
        let cell = myTableView.cellForRow(at: [indexPath.section, i])
        cell?.accessoryType = .none
      }
      selectedRowsInsections[indexPath.section][indexPath.row] = true
      myTableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
      userdefaults.set(selectedRowsInsections[indexPath.section][indexPath.row], forKey: "selected")
      
      var storeArray = userdefaults.stringArray(forKey: "selected")
      myTableView.reloadData()
      
      print(selectedRowsInsections[indexPath.section], indexPath)
      print(storeArray)
    }
  }
  
  
  
  override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    tableView.cellForRow(at: indexPath)?.accessoryType = .none
  }
  
  @IBAction func doneSetting(_ sender: UIBarButtonItem) {
    
    
  }
  
    
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


