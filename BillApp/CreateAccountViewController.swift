//
//  CreateAccountViewController.swift
//  BillApp
//
//  Created by Jesus Fragoso on 9/4/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func CreateAccount(_ sender: Any) {
        if self.repassword.text! == self.password.text!{
        Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!){ (user, error) in
            if self.repassword.text! == self.password.text!{
            if user != nil {
                ToastView.shared.short(self.view, txt_msg: "You signed up")
            }
            if error != nil{
                ToastView.shared.short(self.view, txt_msg: "Account already exist")
            }
            }
            }    }
        else{
            ToastView.shared.short(self.view, txt_msg: "Passwords dont match")
        }
        }
    
    
}
