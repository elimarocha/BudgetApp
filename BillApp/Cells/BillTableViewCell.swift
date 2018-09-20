//
//  BillTableViewCell.swift
//  BillApp
//
//  Created by Evelyn Lima on 8/25/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class BillTableViewCell: UITableViewCell {
    
    var ref: DatabaseReference!
    static let reuseIdentifier = String(describing: BillTableViewCell.self)
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    

         var yourVariable = 0;
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // dateLabel.text = "Monday\n 08/27"
    }
    

    func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd"
    
        let myString = formatter.string(from: date)
        return myString
       
    }
    
    
    func configureCell(bill: Bill) {
        
        self.ref = Database.database().reference()
        amountLabel.text = "$" + bill.amount
        categoryLabel.text = bill.category
        dateLabel.text = dateToString(date: bill.dueDate)
        let post = [
            "BillAmount": bill.amount ,
            "Category": categoryLabel.text!,
            "Date":   dateLabel.text!,
            "PaymentRepeat": bill.paymentRepeat
        ]
        
        
                let userID = Auth.auth().currentUser!.uid
                 self.ref.child("AppUsers").child(userID).child(String(yourVariable)).setValue([post])
               
        yourVariable = yourVariable + 1;
    
        
       
        
        
    }
    
}
