//
//  ViewController.swift
//  designPatterns_MVVM
//
//  Created by Sonny on 2018/3/30.
//  Copyright © 2018年 SonnyCompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    var sectionArray = [["12 Hour", "24 Hour"],["Impreial", "Metric"],["Fahrenheit", "Celcius"]]
//    var section1Array = ["12 Hour","24 Hour"]
//    var section2Array = ["Impreial", "Metric"]
//    var section3Array = ["Fahrenheit","Celcius"]
    var indexDidTapped:Int?
    var selectIndex: [[Bool]] = [[true,false],[true,false],[true,false]]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sectionArray.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
    
        
//        switch section {
//        case 0 :
//            return sectionArray[0].count
//        case 1:
//            return sectionArray[1].count
//        case 2:
//            return sectionArray[2].count
//        default:
//        return 0
//        }
        return self.sectionArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
//        switch indexPath.section {
//        case 0:
////            cell.textLabel?.text = section1Array[indexPath.row]
//            cell.textLabel?.text = sectionArray[0][indexPath.row]
//        case 1:
////            cell.textLabel?.text = section2Array[indexPath.row]
//            cell.textLabel?.text = sectionArray[1][indexPath.row]
//        case 2:
////            cell.textLabel?.text = section3Array[indexPath.row]
//            cell.textLabel?.text = sectionArray[2][indexPath.row]
//        default:break
//
//        }
        
        //text of the cell
//        cell.textLabel?.text = sectionArray[indexPath.section][indexPath.row]
//        cell.accessoryType = .none
        
//        print(selectIndex[indexPath.section][indexPath.row])
//
//        //accorytype of the cell
//
////        for (x, valueX) in selectIndex.enumerated() {
////            for (y, valueY) in valueX.enumerated() {
////                print(x,y)
////
////            }
//////                                if selectIndex[x][y] == true {
//////                                    sectionArray[x][y].accessoryType = .checkmark
//////                            }else {
//////                                sectionArray[x][y].accessoryType = .none
//////                            }
////        }
////        for x in selectIndex[indexPath.section] {
////            dump(x)
////
////        }
//
//
//
//
//
        
        return cell
    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        print(sectionArray[indexPath.section][indexPath.row])
////        print(tableView.indexPathForSelectedRow)
////        print("section:\(indexPath.section), row:\(indexPath.row)")
//        let cell = tableView.cellForRow(at: indexPath)
////        cell?.accessoryType = .checkmark
//        let selectSection = indexPath.section
//        let selectRow = indexPath.row
//          print("section:\(selectSection), row:\(selectRow)")
//
//        switch selectSection {
//        case 0:
//            for i in 0..<indexPath.row {
//                if selectRow == i {
//                    tableView.cellForRow(at: [0,i])?.accessoryType = .checkmark
//                    print("checkmark")
//                }else {
//                    tableView.cellForRow(at: [0,i])?.accessoryType = .none
//                    print("none")
//                }
//            }
//        default:
//            break
//
//        }
        
        
        
        
//    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func viewWillAppear(_ animated: Bool) {
//        cell.
//    }

}

