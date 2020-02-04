//
//  ListViewController.swift
//  Git4IOS
//
//  Created by Максим Вильданов on 29.11.2019.
//  Copyright © 2019 Максим Вильданов. All rights reserved.
//

import UIKit

final class ListViewController: UITableViewController {
    
    // MARK: - Public variables
    public var topItems = [Items]() {
        didSet {
            tableView.reloadData()
        }
    }
    public var otherItems = [Items]() {
        didSet {
            tableView.reloadData()
        }
    }
    public var jsonModel: Model? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.reuseID)
        
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Top - 3"
        }
        return "Other"
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_: UITableView, numberOfRowsInSection sections: Int) -> Int {
        if sections == 0 {
            return topItems.count
        }
        return otherItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let name = indexPath.section == 0 ? topItems[indexPath.row].name : otherItems[indexPath.row].name
        let starCount = indexPath.section == 0 ? topItems[indexPath.row].stargazers_count : otherItems[indexPath.row].stargazers_count
        let cell = tableView.dequeueReusableCell(withIdentifier: ListViewCell.reuseID, for: indexPath) as! ListViewCell
        if let name = name, let starCount = starCount {
            cell.titleName.text = name
            cell.starCount.text = "★" + String(starCount)
            return cell
        }
        return UITableViewCell()
        
    }
    
}
