//
//  BillTableViewCell.swift
//  BillApp
//
//  Created by Evelyn Lima on 8/25/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import UIKit

class BillTableViewCell: UITableViewCell {

    static let reuseIdentifier = String(describing: BillTableViewCell.self)
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
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
        amountLabel.text = "$" + bill.amount
        categoryLabel.text = bill.category
        dateLabel.text = dateToString(date: bill.dueDate)
    }
    
}
