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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dateLabel.text = "Monday\n 08/27"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
