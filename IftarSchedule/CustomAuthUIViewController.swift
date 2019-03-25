//
//  CustomAuthUIViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import FirebaseUI

class CustomAuthUIViewController: FUIAuthPickerViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        self.navigationItem.setLeftBarButton(nil, animated: true)
        self.navigationController?.navigationBar.isTranslucent = false
        
        
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height - 200
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "AuthUIimage")
        
        imageViewBackground.contentMode = .scaleToFill
        view.addSubview(imageViewBackground)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        self.navigationController?.navigationBar.titleTextAttributes  = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                         NSAttributedString.Key.font: Font.xlarge02]
        self.navigationController?.navigationBar.topItem?.title =  "Ramadan 2019"
        
        self.navigationController?.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        self.navigationController?.navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
}
