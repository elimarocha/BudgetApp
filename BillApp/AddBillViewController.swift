//
//  AddBillViewController.swift
//  BillApp
//
//  Created by Evelyn Lima on 8/25/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import Foundation
import UIKit

class AddBillViewController: UIViewController {
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.target = self
        doneButton.action = #selector(doneAction)
        
    }
    
    @objc func doneAction() {
        
        guard let home = self.navigationController?.viewControllers.first as? HomeViewController else {
            return
        }
        
        home.billsContainer.quantity = home.billsContainer.quantity + 1
        self.navigationController?.popViewController(animated: true)
    }
}
