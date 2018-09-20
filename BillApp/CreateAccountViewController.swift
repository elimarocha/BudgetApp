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
import FirebaseDatabase
class CreateAccountViewController: UIViewController {
    var ref: DatabaseReference!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var repassword: UITextField!
    
    @IBOutlet weak var username: UITextField!
    
    
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
                            self.ref = Database.database().reference()
                            let customE : String = (self.username.text!)
                            if user != nil {
                                ToastView.shared.short(self.view, txt_msg: "You signed up")
                                
                                self.ref.child("AppUsers").child(customE).setValue(["username": self.email.text!])
                                
                                func createEmail() -> Email {
                                    let email = Email(Email: customE )
                                    return email
                                }
                            }
                            if error != nil{
                                ToastView.shared.short(self.view, txt_msg: "Can't sign up")
                            }
                        }
                    }
                    
                }
                else{
                    ToastView.shared.short(self.view, txt_msg: "Passwords dont match")
                }
           
        
        }
    
    
}
