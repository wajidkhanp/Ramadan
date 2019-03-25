//
//  AshraViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class AshraViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Ramadan Ashra 2019"
        navigationController?.navigationBar.removeShadow()
        
        tableView.tableFooterView = UIView()
        
        tableView.delegate = self
        tableView.dataSource = self 
     
        
        tableView.register(AshraTableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NormalCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            print("inside table view cell ")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! AshraTableViewCell
            cell.backgroundColor = UIColor.blue
            return cell
        } else {
             print("inside table view cell 89879879")
            let cell = tableView.dequeueReusableCell(withIdentifier: "NormalCell", for: indexPath)
            cell.textLabel?.text = "cell: \(indexPath.row)"
            return cell
        }
        
    }
    

}
