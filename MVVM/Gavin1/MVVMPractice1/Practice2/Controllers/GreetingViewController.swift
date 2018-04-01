//
//  GreetingViewController.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/4/1.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class GreetingViewController : UIViewController {
  
  @IBOutlet weak var greetingLabel: UILabel!
  
  var viewModel: GreetingViewModelProtocol! {
    didSet {
      print("view model did set")
      self.viewModel.greetingDidChange = { [unowned self] viewModel in
        self.greetingLabel.text = viewModel.greeting
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let model = Person(firstName: "Gavin", lastName: "Wu")
    let viewModel = GreetingViewModel(person: model)
    
    self.viewModel = viewModel
  }
  
  @IBAction func showGreeting(_ sender: Any) {
    self.viewModel.showGreeting()
  }
  
}
