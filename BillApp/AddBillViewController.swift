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
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    
    private let datePicker = UIDatePicker()
    private let categoryPickerView = UIPickerView()
    
    enum Constants {
        static let categories = ["Auto", "Cable Tv", "CellPhone", "ChildCare", "Credit Card", "Education", "Electricity", "Entertainment", "Gas",
                                 "Gifts", "Home", "Insurance", "Internet","Medical", "Mortgage", "Parking", "Pets", "Renr", "Security", "Tax",
                                 "Telephone", "Transportation","Water", "Other"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installView()
    }
    
    private func installView() {
        
        showDatePicker()
        showCategoryPicker()
        
        doneButton.target = self
        doneButton.action = #selector(doneAction)
        amountTextField.delegate = self
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func doneAction() {
        
        guard let home = self.navigationController?.viewControllers.first as? HomeViewController else {
            return
        }
        
        home.billsContainer.quantity = home.billsContainer.quantity + 1
        self.navigationController?.popViewController(animated: true)
    }
    
    func showCategoryPicker() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donePickerButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneCategoryPicker))
        toolbar.setItems([donePickerButton], animated: true)
        
        categoryTextField.inputView = categoryPickerView
        categoryTextField.inputAccessoryView = toolbar
    }
    
    func showDatePicker() {
        
        datePicker.datePickerMode = .date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donePickerButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneDatePicker))
        toolbar.setItems([donePickerButton], animated: true)
        
        dateTextField.inputView = datePicker
        dateTextField.inputAccessoryView = toolbar
    }
    
    @objc func doneDatePicker() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func doneCategoryPicker() {
        self.view.endEditing(true)
    }
}

extension AddBillViewController: UITextFieldDelegate {
    
    
}

extension AddBillViewController: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.categories[row]
    }
}

extension AddBillViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = Constants.categories[row]
    }
}
