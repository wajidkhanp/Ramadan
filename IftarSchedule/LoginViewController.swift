//
//  ViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseUI
import Firebase

class LoginViewController: UIViewController, FUIAuthDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        checkLoggedIn()
        
        // Do any additional setup after loading the view.
    }
    
    func checkLoggedIn() {
        
        Auth.auth().addStateDidChangeListener { auth, user in
            if user != nil {
                print("User is signed in")
                let layout = UICollectionViewFlowLayout()
                let controller = UINavigationController(rootViewController: DashboardViewController(collectionViewLayout: layout))
                self.present(controller, animated: false, completion: nil)
            } else {
                print("User is not signed in")
                self.login()
            }
        }
    }
    
    func login() {
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else {
            print("No default Auth UI" )
            return
        }
        authUI!.delegate = self
        let providers: [FUIAuthProvider] = [ FUIGoogleAuth(),FUIEmailAuth()]
        authUI!.providers = providers
        let authviewController = CustomAuthUIViewController(authUI: authUI!)
        let navc = UINavigationController(rootViewController: authviewController)
        self.present(navc, animated: true, completion: nil)
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            print("problem in signing in")
            login()
        } else {
            let layout = UICollectionViewFlowLayout()
            let controller = UINavigationController(rootViewController: DashboardViewController(collectionViewLayout: layout))
            present(controller, animated: false, completion: nil)
        }
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
    
}
