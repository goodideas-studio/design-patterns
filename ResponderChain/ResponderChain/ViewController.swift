//
//  ViewController.swift
//  ResponderChain
//
//  Created by JeremyXue on 2018/4/30.
//  Copyright © 2018年 JeremyXue. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    var things = ["UIResponder","UIEvent"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return things.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = things[indexPath.row]
        
        return cell
    }
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    @IBAction func printNext(_ sender: Any) {
        var responder = sender as? UIResponder
        print(responder!)
        
        while responder != nil {
            responder = responder?.next
            
            if let next = responder {
                print(next)
            } else {
                return
            }
            
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

// See the chain in action

extension UIView {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIView")
        next?.touchesBegan(touches, with: event)
    }
}

extension UIViewController {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIViewController")
        next?.touchesBegan(touches, with: event)
    }
}

extension UIWindow {
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("UIWindow")
        next?.touchesBegan(touches, with: event)
    }
}

extension AppDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("AppDelegate")
    }
}
