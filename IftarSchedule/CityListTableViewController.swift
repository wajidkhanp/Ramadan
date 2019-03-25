//
//  MasjidListTableViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseDatabase

class CityListTableViewController: UITableViewController {
    
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle!
    var citylist = [CityListModle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Choose City"
        
        tableView.tableFooterView = UIView()
        tableView.register(MasjidListCell.self, forCellReuseIdentifier: "postcell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set the database referece
        ref = Database.database().reference().child("masjidlist")
        print("Database refernce \(String(describing: ref))")
        
        ref.observeSingleEvent(of: .value, with: { snapshot in
            
            if !snapshot.exists() { return }
            print(snapshot) // Its print all values including Snap (User)
            print(snapshot.value!)
            
            if snapshot.childrenCount > 0 {
                self.citylist.removeAll()
                
                for cities in snapshot.children.allObjects as! [DataSnapshot] {
                    
                    let cityObject = cities.key
                    let masjidCount = cities.childrenCount
                    print("number of masjids in the city \(masjidCount)")
                    
                    let city = CityListModle(cityName: cityObject , masjidCount: masjidCount )
                    self.citylist.append(city)
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
        return citylist.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! MasjidListCell
        let city: CityListModle = citylist[indexPath.row]
        cell.cellImage.image = UIImage(named: "city")
        cell.masjidName.text = city.cityName
        cell.masjidAddress.text = "Number of Masjids: \(city.masjidCount ?? 0)"
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    @objc func logoutUser() {
        try! Auth.auth().signOut()
        let controller = UINavigationController(rootViewController: LoginViewController())
        present(controller, animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city: CityListModle = citylist[indexPath.row]
        let citySelected: String = city.cityName!
        let controller = MasjidListViewController(cityName: citySelected)
        let navigationControllet = UINavigationController(rootViewController: controller)
        navigationControllet.modalPresentationStyle = UIModalPresentationStyle.currentContext
        present(navigationControllet, animated: true, completion: nil)
    }
    
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) -> Void {
        if gesture.direction == UISwipeGestureRecognizer.Direction.right {
            backAction()
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
