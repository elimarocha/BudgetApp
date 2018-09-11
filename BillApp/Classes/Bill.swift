//
//  Bill.swift
//  BillApp
//
//  Created by Evelyn Lima on 9/9/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import Foundation

class Bill {
    let amount: String
    let dueDate: Date
    let autoPay: Bool
    let category: String
    let paymentRepeat: String
    
    init(amount: String, dueDate: Date, autoPay: Bool, category: String, paymentRepeat: String) {
        self.amount = amount
        self.dueDate = dueDate
        self.autoPay = autoPay
        self.category = category
        self.paymentRepeat = paymentRepeat
    }
}
