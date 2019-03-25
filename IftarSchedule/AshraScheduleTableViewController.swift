//
//  MainScheduleTableViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseDatabase

class AshraScheduleTableViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var ashraDetails = [AshraDetails]()
    var ashraSelected: String = "ashra1"
   lazy var ashraNumber:String = ""
    
    var ramadanAshraList = GlobalData.ramadanScheduleMain
    let v = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
    let label = UILabel(frame: CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width - 30, height: 60))
    let todaysDate = Helper.app.dateFormatter(date: Date())
    
    
    public init(ashraName: String) {
        self.ashraSelected = ashraName
        super.init(style: .plain)
        
        switch ashraSelected {
        case "ashra1":
            ashraNumber = "First Ashra"
        case "ashra2":
            ashraNumber = "Second Ashra"
        case "ashra3":
            ashraNumber = "Third Ashra"
        default:
            print("Something went wrong with ashra name or number")
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = GlobalData.lightGray
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "\(ashraNumber)"
        navigationController?.navigationBar.removeShadow()
        
        tableView.tableFooterView = UIView()
        tableView.register(AshraTableViewCell.self, forCellReuseIdentifier: "postcell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
        
    
        
        label.numberOfLines = 2
        label.font = Font.large02
        label.textColor = UIColor.white
        label.text = "Today is: \(todaysDate)"
        label.textAlignment = .center
        v.addSubview(label)
        v.backgroundColor = GlobalData.navigationMainColor
        tableView.tableHeaderView = v
        
        // Set the database referece
        ref = Database.database().reference().child("ramadan/\(ashraSelected)")
        print("Database refernce \(String(describing: ref))")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            print(snapshot.value!)
            if snapshot.childrenCount > 0 {
                self.ashraDetails.removeAll()
                
                for ashraDays in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let ashraday = ashraDays.value as? [String: AnyObject]
                    let date =  ashraday?["day"] 
                    let seharTime = ashraday?["sehar"]
                    let iftarTime = ashraday?["iftar"]
                    
                    let event = AshraDetails(day: date as? String, sehar: seharTime as? String, iftar: iftarTime as? String )
                    self.ashraDetails.append(event)
                }
                self.tableView.reloadData()
            }
        })
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ashraDetails.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! AshraTableViewCell
       let ashraDetailslist: AshraDetails = ashraDetails[indexPath.row]
        cell.day.text =   ashraDetailslist.day
        cell.seher.text = ashraDetailslist.sehar
        cell.iftar.text = ashraDetailslist.iftar
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.backgroundColor = GlobalData.greenColor
            cell.textLabel?.font = Font.xlarge02
        } else {
        cell.backgroundColor = UIColor.white
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
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
        let controller = UINavigationController(rootViewController: MainScheduleTableViewController())
        present(controller, animated: false, completion: nil)
    }
}

