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
    @IBOutlet weak var repeatCategoryTextField: UITextField!
    @IBOutlet weak var autoPaySwitch: UISwitch!
    
    private let datePicker = UIDatePicker()
    private let categoryPickerView = UIPickerView()
    private let repeatCategoryPickerView = UIPickerView()
    
    enum Constants {
        static let categories = ["Auto", "Cable Tv", "CellPhone", "ChildCare", "Credit Card", "Education", "Electricity", "Entertainment", "Gas",
                                 "Gifts", "Home", "Insurance", "Internet","Medical", "Mortgage", "Parking", "Pets", "Renr", "Security", "Tax",
                                 "Telephone", "Transportation","Water", "Other"]
        static let repeatCategories = ["Never", "Every Week", "Every 2 Weeks", "Every Month", "Every 2 Months",
                                       "Every 3 Months","Every 4 Months", "Every 6 Months", "Every Year"]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        installView()
    }
    
    private func installView() {
        
        showDatePicker()
        showCategoryPicker()
        showRepeatCategoryPicker()
        
        doneButton.target = self
        doneButton.action = #selector(doneAction)
        amountTextField.delegate = self
        categoryPickerView.delegate = self
        categoryPickerView.dataSource = self
        repeatCategoryPickerView.delegate = self
        repeatCategoryPickerView.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func doneAction() {
        
        if checkInputFields() == false {
            return
        }
        
        let bill = createBill()
       
        guard let home = self.navigationController?.viewControllers.first as? HomeViewController else {
            return
        }
        
        home.billsContainer.append(bill)
        self.navigationController?.popViewController(animated: true)
    }
    
    func createBill() -> Bill {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: dateTextField.text ?? "")

        
        let bill = Bill(amount: amountTextField.text!,
                         dueDate: date ?? Date(),
                         autoPay: autoPaySwitch.isOn,
                         category: categoryTextField.text!,
                         paymentRepeat: repeatCategoryTextField.text!)
        return bill
    }

    
    func checkInputFields() -> Bool {
        var check = true
        if amountTextField.text?.isEmpty ?? true {
            check = false
        }
        else if dateTextField.text?.isEmpty ?? true {
            check = false
        }
        else if categoryTextField.text?.isEmpty ?? true {
            check = false
        }
        else if repeatCategoryTextField.text?.isEmpty ?? true {
            check = false
        }
        
        return check
    }
    
    func showCategoryPicker() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donePickerButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneCategoryPicker))
        toolbar.setItems([donePickerButton], animated: true)
        
        categoryTextField.inputView = categoryPickerView
        categoryTextField.inputAccessoryView = toolbar
    }
    func showRepeatCategoryPicker() {
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let donePickerButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneCategoryPicker))
        toolbar.setItems([donePickerButton], animated: true)
        
        repeatCategoryTextField.inputView = repeatCategoryPickerView
        repeatCategoryTextField.inputAccessoryView = toolbar
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
        if pickerView == categoryPickerView {
            return Constants.categories.count
        }
        else if pickerView == repeatCategoryPickerView{
        return Constants.repeatCategories.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == categoryPickerView {
            return Constants.categories[row]
        }
        else if pickerView == repeatCategoryPickerView{
            return Constants.repeatCategories[row]
        }
        return " "
    }
}

extension AddBillViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == categoryPickerView {
            return  categoryTextField.text = Constants.categories[row]
        }
        else if pickerView == repeatCategoryPickerView{
            return repeatCategoryTextField.text = Constants.repeatCategories[row]
        }
    }
}
