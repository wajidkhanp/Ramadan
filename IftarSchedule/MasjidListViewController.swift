//
//  ProfileViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseDatabase

class MasjidListViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var masjidlist = [MasjidModle]()
    var citySelected: String = ""
    
    public init(cityName: String) {
        self.citySelected = cityName
        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Masjid List"
        
        tableView.tableFooterView = UIView()
        tableView.register(MasjidListCell.self, forCellReuseIdentifier: "postcell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set the database referece
        ref = Database.database().reference().child("masjidlist/\(citySelected)")
        print("Database refernce \(String(describing: ref))")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            print(snapshot) // Its print all values including Snap (User)
            print(snapshot.value!)
            
            if snapshot.childrenCount > 0 {
                self.masjidlist.removeAll()
                
                for masjids in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let masjidObject = masjids.value as? [String: AnyObject]
                    let masjidName = masjidObject?["name"]
                    let masjidAddress = masjidObject?["address"]
                    let masjidContact = masjidObject?["contact"]
                    let masjidweblink = masjidObject?["weblink"]
                    
                    let masjid = MasjidModle(name: (masjidName as! String), address: (masjidAddress as! String), contact: (masjidContact as! String), weblink: (masjidweblink as! String))
                    self.masjidlist.append(masjid)
                }
                self.tableView.reloadData()
            }
        })
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return masjidlist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! MasjidListCell
        let masjid: MasjidModle = masjidlist[indexPath.row]
        cell.cellImage.image = UIImage(named: "masjidin")
        cell.masjidName.text = masjid.name
        cell.masjidAddress.text = masjid.address
        cell.masjidContact.text = masjid.contact
        
        if masjid.weblink?.isEmpty == !true {
            cell.accessoryType = .disclosureIndicator
            cell.selectionStyle = .default
        } else{
            cell.selectionStyle = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let masjid: MasjidModle = masjidlist[indexPath.row]
        let masjidWebviewLink: String = masjid.weblink!
        if masjid.weblink?.isEmpty == !true {
            let navigationControllet = UINavigationController(rootViewController: WebViewController(masjidWebView: masjidWebviewLink))
            navigationControllet.modalPresentationStyle = UIModalPresentationStyle.currentContext
            present(navigationControllet, animated: true, completion: nil)
        }
    }
    
    @objc func backAction(){
        let transition = CATransition()
        transition.duration = 0.6
        transition.type = .reveal
        transition.subtype = .fromLeft
        view.window!.layer.add(transition, forKey: nil)
        let controller = UINavigationController(rootViewController: CityListTableViewController())
        present(controller, animated: false, completion: nil)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            self.backAction()
        }
    }
}
