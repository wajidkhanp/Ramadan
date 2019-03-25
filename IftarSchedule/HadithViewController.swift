//
//  HadithViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/22/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class HadithViewController: UIViewController {
    
    let toBeLabel: UILabel = Components.descriptionLable(text: "Construction Going On")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = GlobalData.lightGray
        view.addSubview(toBeLabel)

        toBeLabel.font = Font.xlarge02
        toBeLabel.textColor = GlobalData.creamRedColor
        toBeLabel.textAlignment = .center
        
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Hadith of the Day"
  
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
       
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        toBeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toBeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        toBeLabel.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        toBeLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
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

extension UIBarButtonItem {
    
    static func menuButton(_ target: Any?, action: Selector, imageName: String) -> UIBarButtonItem {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.tintColor = UIColor.white
        button.addTarget(target, action: action, for: .touchUpInside)
        
        let menuBarItem = UIBarButtonItem(customView: button)
        menuBarItem.customView?.translatesAutoresizingMaskIntoConstraints = false
        menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 40).isActive = true
        menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
        return menuBarItem
    }
}
