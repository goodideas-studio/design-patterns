//
//  TableViewController.swift
//  gavinTableView
//
//  Created by JeremyXue on 2018/3/29.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let array1 = ["12 Hours","24 Hours"]
    let array2 = ["Imperial","Metric"]
    let array3 = ["Celsius","Fahrenheit"]
    
    var sections = [[String]]()
    
    var saveArray = [0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sections = [array1,array2,array3]
        if UserDefaults.standard.array(forKey: "sectionSelected") != nil {
            saveArray = UserDefaults.standard.array(forKey: "sectionSelected") as! [Int]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return sections[section].count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

//        switch indexPath.section {
//        case 0:
//            cell.textLabel?.text = array1[indexPath.row]
//            if indexPath.row == saveArray[0] {
//                cell.accessoryType = .checkmark
//            }
//        case 1:
//            cell.textLabel?.text = array2[indexPath.row]
//            if indexPath.row == saveArray[1] {
//                cell.accessoryType = .checkmark
//            }
//        case 2:
//            cell.textLabel?.text = array3[indexPath.row]
//            if indexPath.row == saveArray[2] {
//                cell.accessoryType = .checkmark
//            }
//        default:
//            cell.textLabel?.text = "??????"
//            return cell
//        }
        
        
        cell.textLabel?.text = sections[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.section {
        case 0:
            for i in 0..<self.array1.count {
                tableView.cellForRow(at: [0,i])?.accessoryType = .none
            }
            saveArray[0] = indexPath.row
        case 1:
            for i in 0..<self.array2.count {
                tableView.cellForRow(at: [1,i])?.accessoryType = .none
            }
            saveArray[1] = indexPath.row
        case 2:
            for i in 0..<self.array3.count {
                tableView.cellForRow(at: [2,i])?.accessoryType = .none
            }
            saveArray[2] = indexPath.row
        default:
            break
        }
        
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.set(saveArray, forKey: "sectionSelected")
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

}
