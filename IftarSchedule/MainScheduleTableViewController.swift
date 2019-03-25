//
//  MainScheduleTableViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class MainScheduleTableViewController: UITableViewController {

    var ramadanAshraList = GlobalData.ramadanScheduleMain
    let v = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
    let label = UILabel(frame: CGRect(x: 20, y: 5, width: UIScreen.main.bounds.size.width - 30, height: 60))
    let todaysDate = Helper.app.dateFormatter(date: Date())
    var ashraName: String = ""
    var ashraDetails: String = ""
    var message: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Ramadan 2019"
        navigationController?.navigationBar.removeShadow()
        
        tableView.tableFooterView = UIView()
        tableView.register(MasjidListCell.self, forCellReuseIdentifier: "postcell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
        
        label.numberOfLines = 2
        label.font = Font.large01
        label.textColor = UIColor.white
        label.text = "Today \n \(todaysDate)"
        label.textAlignment = .center
        v.addSubview(label)
        v.backgroundColor = GlobalData.navigationMainColor
        tableView.tableHeaderView = v
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ramadanAshraList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as! MasjidListCell
        let ramadanAshra: RamadanShedule = ramadanAshraList[indexPath.row]
        cell.masjidName.text = ramadanAshra.ashra
        cell.masjidAddress.text = ramadanAshra.ashrName
        cell.masjidContact.text = ramadanAshra.dates
        
        switch indexPath.row {
        case 0:
        cell.cellImage.image = UIImage(named: "ashra1")
        case 1:
            cell.cellImage.image = UIImage(named: "ashra2")
        case 2:
            cell.cellImage.image = UIImage(named: "ashra3")
        default:
            cell.cellImage.image = UIImage(named: "ashra1")
        }
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            ashraName = "ashra1"
        case 1:
            ashraName = "ashra2"
        case 2:
            ashraName = "ashra3"
        default:
            print("No right filed defined")
        }
        
        let navigationControllet = UINavigationController(rootViewController: AshraScheduleTableViewController(ashraName: ashraName))
        navigationControllet.modalPresentationStyle = UIModalPresentationStyle.currentContext
        present(navigationControllet, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            ashraDetails = "First Ashra of Ramadan - Mercy"
            message = "First Ten Days of Ramadhan are the days of Mercy and every person or Muslim must seek the mercy of Almighty Allah in these days."
        case 1:
            ashraDetails = "Second Ashra of Ramadan - Forgiveness"
            message = "Second Ashra of Ramadhan consists of the second ten days, it is the time of forgiveness. These are the days of forgiveness and a Muslim must seek for the forgiveness from Almighty Allah and repent for all his sins. During this Ashra, is a time where the forgiveness of Almighty Allah is at its peak. This is the best time for asking about forgiveness for all the sins from Almighty Allah. Always ask for forgiveness from Almighty Allah in all these days. Do make sure to not repeat the sins after you have done Tauba. Do Tauba as many times as possible, because Allah Almighty loves Tauba during this period and forgives the one who seeks for his forgiveness. Forgive all your beloved in these days as Allah Almighty loves Maghfirah."
        case 2:
            ashraDetails = "Third Ashra of Ramadan - Safety"
            message = "In the end, Ramadhan is all about seeking refuge in Almighty Allah from hell fire. Everyone must pray that “O Almighty Allah, save me from the fire of Hell. The last ten days of Ramadhan are third Ashra and are very superior and important as the Lailatul Qadar also falls in the last Ashra.  Most of the Muslims also practice Ihtikaf in the last ten days. A Muslim must not waste the last ten nights of Ashra and work hard in worshipping Almighty Allah. The best way for practicing Itekaf is one in which a person stays in the masjid and seeks pardon from Almighty Allah for all his sins."
        default:
            print("No right filed defined")
        }
        let ac = UIAlertController(title: "\(ashraDetails)", message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        ac.addColorInTitleAndMessage(color: GlobalData.creamRedColor, titleFontSize: 18, messageFontSize: 13)
        self.present(ac, animated: true)
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

extension UIAlertController {
    
    func addColorInTitleAndMessage(color:UIColor,titleFontSize:CGFloat = 18, messageFontSize:CGFloat = 13){
        
        let attributesTitle = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: titleFontSize)]
        let attributesMessage = [NSAttributedString.Key.foregroundColor: color, NSAttributedString.Key.font: UIFont.systemFont(ofSize: messageFontSize)]
        let attributedTitleText = NSAttributedString(string: self.title ?? "", attributes: attributesTitle)
        let attributedMessageText = NSAttributedString(string: self.message ?? "", attributes: attributesMessage)
        
        self.setValue(attributedTitleText, forKey: "attributedTitle")
        self.setValue(attributedMessageText, forKey: "attributedMessage")
        
    }}
