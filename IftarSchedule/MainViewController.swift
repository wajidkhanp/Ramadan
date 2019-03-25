//
//  ViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseUI


class MainViewController: UIViewController, FUIAuthDelegate {
    
    let welcomeLable: UILabel = Components.descriptionLable(text: "Welcome to Ramadan 2019")
    let subHeading: UILabel = Components.subHeadingLabel(text: "Please Sign in or Login ")
    let loginButton: UIButton = Components.butonElement(title: "Continue")
    var backgroundImage: UIImageView!
    var customAuthPickerViewController: FUIAuthPickerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        navigationController?.navigationBar.barTintColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes  = [NSAttributedString.Key.foregroundColor: UIColor.green,
                                                                    NSAttributedString.Key.font: Font.large01]
        navigationItem.title = "Iftar Schedule 2019"
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: "AuthUIimage")
        
        imageViewBackground.contentMode = .scaleAspectFill
        view.insertSubview(imageViewBackground, at: 0)
        setupView()
        
        
    }
    
    func setupView() {
        
        view.addSubview(welcomeLable)
        view.addSubview(subHeading)
        view.addSubview(loginButton)
        
        welcomeLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        welcomeLable.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250).isActive = true
        
        subHeading.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        subHeading.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 280).isActive = true
        
        
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        loginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }
    @objc func loginBtnTapped() {
        
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else {
            print("No default Auth UI" )
            return
        }
        authUI!.delegate = self
        let providers: [FUIAuthProvider] = [
            FUIGoogleAuth(),
            FUIEmailAuth()
            ]
        authUI!.providers = providers
        let authviewController = CustomAuthUIViewController(authUI: authUI!)
        
        let navc = UINavigationController(rootViewController: authviewController)
        self.present(navc, animated: true, completion: nil)
        
    }

    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        guard error == nil else {
            
            print("unable to authenticate")
            return
        }
        
        let authuseriD = authDataResult?.user.uid
        print("\(authuseriD) ***************************************" )
        
        let controller = UINavigationController(rootViewController: CityListTableViewController())
        present(controller, animated: false, completion: nil)
    }
}


