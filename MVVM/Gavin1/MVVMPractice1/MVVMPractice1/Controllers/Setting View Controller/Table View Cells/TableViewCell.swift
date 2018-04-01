//
//  SettingTableViewCell.swift
//  MVVMPractice1
//
//  Created by PinguMac on 2018/3/29.
//  Copyright © 2018年 PinguMac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
  
  // MARK: - Type Properties
  static let reuseIdentifier = "SettingsCell"
  
  // MARK: - Properties
  @IBOutlet var mainLabel: UILabel!
  
  // MARK: - Initialization
  override func awakeFromNib() {
    super.awakeFromNib()
    
    // Initialization code
    selectionStyle = .none
  }
  
  // MARK: - Configuration
  func configure(withViewModel viewModel: SettingsRepresentable) {
    mainLabel.text = viewModel.text
    accessoryType = viewModel.accessoryType
  }
  
}
