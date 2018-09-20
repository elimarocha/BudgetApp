//
//  CheckBox.swift
//  BillApp
//
//  Created by Evelyn Lima on 9/19/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import Foundation

import UIKit

class CheckBox: UIButton {
    // Images
    let checkImage = UIImage(named: "Check")
   
    // Bool property
    var isChecked: Bool = false {
        didSet{
            self.tintColor = isChecked ? UIColor.green : UIColor.gray
        }
    }
    
    override func awakeFromNib() {
        self.setImage(checkImage, for: UIControlState.normal)
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
}
