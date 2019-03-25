//
//  IslamicDatesTableViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseDatabase

class IslamicDatesTableViewController: UITableViewController {

    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var islamicDateList = [IslamicDates]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Events & News"
        
        tableView.tableFooterView = UIView()
        tableView.register(IslamicDatesTableViewCell.self, forCellReuseIdentifier: "postcell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
       
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
        
        // Set the database referece
        ref = Database.database().reference().child("islamicDates")
        print("Database refernce \(String(describing: ref))")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            print(snapshot.value!)
            if snapshot.childrenCount > 0 {
                self.islamicDateList.removeAll()
                
                for islamicEvents in snapshot.children.allObjects as! [DataSnapshot] {
                    
                let islamicEventObject = islamicEvents.value as? [String: AnyObject]
                let date = islamicEventObject?["date"]
                let islamicdate = islamicEventObject?["islamicdate"]
                let name = islamicEventObject?["name"]
                
                    let event = IslamicDates(date: (date as! String), event: (islamicdate as! String), islamicDay: (name as! String))
                self.islamicDateList.append(event)
                }
                self.tableView.reloadData()
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return islamicDateList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! IslamicDatesTableViewCell
        let islamicDate: IslamicDates = islamicDateList[indexPath.row]
        
        cell.dateLabel.text = islamicDate.date
        cell.evenLabel.text = islamicDate.islamicDay
        cell.islamicDateLabel.text = islamicDate.event
        cell.selectionStyle = .none
        return cell
    }
    
   
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
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
