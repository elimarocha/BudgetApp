//
//  SignInViewController.swift
//  BillApp
//
//  Created by Jesus Fragoso on 8/30/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
class SignInViewController: UIViewController {
   
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func login(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.email.text!, password: self.password.text!){ (user, error) in
            if user != nil {
                ToastView.shared.short(self.view, txt_msg: "You logged in")
            }
            if error != nil{
                ToastView.shared.short(self.view, txt_msg: "Can't login")
            }
        }
    }
    @IBAction func signup(_ sender: Any) {
        Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!){ (user, error) in
            if user != nil {
                ToastView.shared.short(self.view, txt_msg: "You signed up")
            }
            if error != nil{
                ToastView.shared.short(self.view, txt_msg: "Can't signed up")
            }
        }    }
}
