//
//  GreetingViewModel.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/4/1.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import Foundation

protocol GreetingViewModelProtocol: AnyObject {
  var greeting: String? { get }
  
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set } // function to call when greeting did change
  
  init(person: Person)
  
  func showGreeting()
}

class GreetingViewModel : GreetingViewModelProtocol {
  let person: Person
  
  var greeting: String? {
    didSet {
      self.greetingDidChange?(self)
    }
  }
  
  var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
  
  required init(person: Person) {
    self.person = person
  }
  
  func showGreeting() {
    self.greeting = "Hello, " + " " + self.person.firstName + " " + self.person.lastName
  }
}
