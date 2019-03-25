//
//  DashboardCollectionViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseDatabase
import Adhan
import CoreLocation


class DashboardViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, CLLocationManagerDelegate {
    
    let todaysDate = Helper.app.dateFormatter(date: Date())
    let backgroundImage: UIImageView = UIImageView(image:UIImage(named: "salatTiming"))
    let locationManager = CLLocationManager()
    var latitude = 0.0
    var longitude = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage.contentMode = .scaleAspectFill
        
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
    
        collectionView.backgroundView = backgroundImage
        collectionView.register(DashboardCell.self, forCellWithReuseIdentifier: GlobalData.collectionViewCellID)
        collectionView.register(DashboardHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: GlobalData.collectionViewHeaderID)
        
        let logoutBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(logoutUser))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return GlobalData.dashboardCellContents.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GlobalData.collectionViewCellID, for: indexPath) as! DashboardCell
        cell.cellContent = GlobalData.dashboardCellContents[indexPath.item]
       // cell.backgroundColor = UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width / 3) - 16, height: (view.frame.width / 3) - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8 , bottom: 8, right: 8)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = indexPath.row
        switch index {
        case 0:
            let controller = UINavigationController(rootViewController: MainScheduleTableViewController())
           controller.modalPresentationStyle = UIModalPresentationStyle.currentContext
            present(controller, animated: true, completion: nil)
        case 1:
            let controller = UINavigationController(rootViewController:ZakatViewController())
           controller.modalPresentationStyle = UIModalPresentationStyle.currentContext
            present(controller, animated: true, completion: nil)
        case 2:
            let controller = UINavigationController(rootViewController: RamadanChecklistTableViewController())
            controller.modalPresentationStyle = UIModalPresentationStyle.currentContext
            present(controller, animated: true, completion: nil)
        case 3:
            let controller = UINavigationController(rootViewController: IslamicDatesTableViewController())
            controller.modalPresentationStyle = UIModalPresentationStyle.currentContext
            present(controller, animated: true, completion: nil)
        case 4:
            let controller = UINavigationController(rootViewController: CityListTableViewController())
            controller.modalPresentationStyle = UIModalPresentationStyle.currentContext
            present(controller, animated: true, completion: nil)
        case 5:
            let controller = UINavigationController(rootViewController: HadithViewController())
            controller.modalPresentationStyle = UIModalPresentationStyle.currentContext
            present(controller, animated: true, completion: nil)
            
        default:
            NSLog("Passed indexpath row does not exist")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:collectionView.frame.size.width, height: 400.0)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: GlobalData.collectionViewHeaderID, for: indexPath) as! DashboardHeader
        let salathTime = Helper.app.prayerTimes()
        headerView.mainHeadingLabel.text = "Bismillah hir-Rahman nir-Rahim"
        headerView.bismillaLabel.text = "Ramadan 2019"
        headerView.subHeadingLabel.text = "One stop for all your Ramadan needs"
        headerView.subHeadingLabe2.text = "\(Helper.app.daysLeftforRamadan(ramadanDate: "2019-05-06"))"
        headerView.subHeadingLabe3.text = "Prayer Times(\(todaysDate))"
        
        headerView.fazar.text =     "Fajr starts at       :  \(salathTime.fazar ?? "")"
        headerView.sunrise.text =   "Sunrise starts at  :  \(salathTime.sunrise ?? "")"
        headerView.zohar.text =     "Zohar starts at     :  \(salathTime.zohar ?? "")"
        headerView.asar.text =      "Asar starts at      :  \(salathTime.asar ?? "") "
        headerView.magrib.text =    "Magrib starts at   :  \(salathTime.magrib ?? "") "
        headerView.isha.text =      "Isha'a starts at    :  \(salathTime.isha ?? "")"
        
          
        if let title =  headerView.subHeadingLabe3.text{
            headerView.subHeadingLabe3.attributedText = title.getUnderLineAttributedText()
        }
        
        return headerView
    }
    
    @objc func logoutUser() {
        try! Auth.auth().signOut()
        let controller = UINavigationController(rootViewController: LoginViewController())
        present(controller, animated: false, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

extension UINavigationBar {
    /// The shadow this removes is a dark line that is visible
    /// when using the HeroView with a blue background.
    @objc public func removeShadow() {
        shadowImage = UIImage()
    }
}

extension String {
    func getUnderLineAttributedText() -> NSAttributedString {
        return NSMutableAttributedString(string: self, attributes: [.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
}
