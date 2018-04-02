//
//  ViewController.swift
//  MVVM_Assignment
//
//  Created by 唐嘉伶 on 30/03/2018.
//  Copyright © 2018 唐嘉伶. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}


//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//  func numberOfSections(in tableView: UITableView) -> Int {
//    return 3
//  }
//
//  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//    let myView: UIView = {
//      let view = UIView()
//      view.backgroundColor = UIColor.lightGray
//      view.translatesAutoresizingMaskIntoConstraints = false
//      view.frame.size.height = 80
//
//      return view
//    }()
//    return myView
//  }
//
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    return (sections[section]?.count)!
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MyCell
//    cell.textLabel?.text = sections[indexPath.section]?[indexPath.row]
//    return cell
//  }

  

