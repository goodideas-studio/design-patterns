//
//  User.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/30.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

struct User {
  var name: Observable<String>
}

class Observable<ObservedType> {
  private var _value: ObservedType? {
    didSet {
      print("did set _value")
    }
  }
  
  init(_ value: ObservedType) {
    _value = value
  }
  
  var valueChanged: ((ObservedType?) -> ())?
  
  public var value: ObservedType? {
    get {
      print("value get")
      return _value
    }
    
    set {
      print("value set")
      _value = newValue
      valueChanged?(_value)
    }
  }
  
  func bindingChanged(to newValue: ObservedType) {
    self._value = newValue
    print("Value is now \(newValue)")
  }
}

class BoundTextField: UITextField {
  var changedClosure: (() -> ())?
  
  @objc func valueChanged() {
    changedClosure?()
  }
  
  func bind(to observable: Observable<String>) {
    addTarget(self, action: #selector(BoundTextField.valueChanged), for: .editingChanged)
    
    changedClosure = { [weak self] in
      observable.bindingChanged(to: self?.text ?? "")
    }
    
    observable.valueChanged = { [weak self] newValue in
      self?.text = newValue
    }
  }
}
