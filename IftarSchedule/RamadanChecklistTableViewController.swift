//
//  RamadanChecklistTableViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/22/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class RamadanChecklistTableViewController: UITableViewController {
    
    let segment: UISegmentedControl = Components.getSegmentedControll(items: ["Daily", "Weekly", "Monthly"])
    let v = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
    
    lazy var rowsToDisplay = GlobalData.daily
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Ramadan Checklist"
        navigationController?.navigationBar.removeShadow()
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ChecklistTableViewCell.self, forCellReuseIdentifier: "checklist007")
        
        v.addSubview(segment)
        v.backgroundColor = UIColor.clear
        tableView.tableHeaderView = v
        
        segment.widthAnchor.constraint(equalToConstant: v.frame.width).isActive = true
        segment.topAnchor.constraint(equalTo: v.topAnchor, constant: 10).isActive = true
        
        segment.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }

     @objc func handleSegmentChange() {
        
        switch segment.selectedSegmentIndex {
        case 0:
            rowsToDisplay = GlobalData.daily
        case 1:
            rowsToDisplay = GlobalData.weekly
        case 2:
            rowsToDisplay = GlobalData.monthly
        default:
            print("Selected index does not exist")
        }
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rowsToDisplay.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "checklist007", for: indexPath) as! ChecklistTableViewCell
        cell.checkListItem.text = rowsToDisplay[indexPath.row]
        cell.selectionStyle = .none
        cell.accessoryType = .checkmark
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }

    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            self.backAction()
        }
    }
    
    @objc func backAction(){
        let transition = CATransition()
        transition.duration = 0.2
        transition.type = .moveIn
        transition.subtype = .fromLeft
        view.window!.layer.add(transition, forKey: nil)
        let layout = UICollectionViewFlowLayout()
        let controller = UINavigationController(rootViewController: DashboardViewController(collectionViewLayout: layout))
        present(controller, animated: false, completion: nil)
    }
    
}
