//
//  WebViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var navigationTitle: String = "Masjid Mobile Site"
    var webViewLink: String = ""
    
    public init(masjidWebView: String) {
        self.webViewLink = masjidWebView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = navigationTitle
        
        let myView = UIView(frame: CGRect(x: 0, y: 72, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width-72))
        self.view.addSubview(myView)
        
        webView = WKWebView()
        webView.navigationDelegate = self
        let url = URL(string: "\(webViewLink)")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
        view = webView
        
          navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
    }
    
    
    @objc func backAction(){
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = .reveal
        transition.subtype = .fromLeft
        view.window!.layer.add(transition, forKey: nil)
        let controller = UINavigationController(rootViewController: CityListTableViewController())
        present(controller, animated: false, completion: nil)
        
    }
    
}

