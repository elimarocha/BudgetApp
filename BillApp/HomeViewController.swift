//
//  HomeViewController.swift
//  BillApp
//
//  Created by Evelyn Lima on 8/25/18.
//  Copyright © 2018 Evelyn Lima. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var billsContainer: [Bill] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    private func customizeView() {
        title = "BillsApp"
        monthLabel.text = "August 2018"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let billNib = UINib(nibName: BillTableViewCell.reuseIdentifier, bundle: nil)
        tableView.register(billNib, forCellReuseIdentifier: BillTableViewCell.reuseIdentifier)
        
        tableView.estimatedRowHeight = 150.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return billsContainer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BillTableViewCell.reuseIdentifier, for: indexPath) as? BillTableViewCell else {
            return UITableViewCell()
        }
    cell.configureCell(bill: billsContainer[indexPath.row])
        return cell
    }
    
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            billsContainer.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}

