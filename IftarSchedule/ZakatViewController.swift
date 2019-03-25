//
//  ZakatViewController.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/19/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class ZakatViewController: UIViewController, UITextFieldDelegate {
    
    let goldandsilverLabel: UILabel = Components.subHeadingLabel(text: "Gold & Silver")
    let goldTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let silverTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")

    let goldLabel: UILabel = Components.formLabel(text: "Value of Total GOLD")
    let silverLabel: UILabel = Components.formLabel(text: "Value of Total SILVER")
    
    let cashandpropertyLabel: UILabel = Components.subHeadingLabel(text: "Cash & Property")
    let cashinhandTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let cashinbankTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let cashinbusinessTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let rentalincomeTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let propertvalueTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let stocksTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    
    
    let cashinhandLabel: UILabel = Components.formLabel(text: "CASH in Hand")
    let cashinbankLabel: UILabel = Components.formLabel(text: "CASH in Bank Account")
    let cashinbusinessLabel: UILabel = Components.formLabel(text: "CASH in Business")
    let rentalincomeLabel: UILabel = Components.formLabel(text: "Rental Income")
    let propertvalueLabel: UILabel = Components.formLabel(text: "Property Value")
    let stocksLabel: UILabel = Components.formLabel(text: "Stocks Value")
    
    
    let debtsandliabilitiesLabel: UILabel = Components.subHeadingLabel(text: "Debts & Liabilities")
    let debtstofamilyTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let debtstoothersTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let creditcardpaymentsTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let homepaymentTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let carpaymentTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    let businesspaymentTextFiled: UITextField = Components.inputTestFiled(placeHolder: "$0.0")
    
    let debtstofamilyLabel: UILabel = Components.formLabel(text: "Debts to Family")
    let debtstoothersLabel: UILabel = Components.formLabel(text: "Debts to Others")
    let creditcardpaymentsLabel: UILabel = Components.formLabel(text: "Credit Card Payments")
    let homepaymentLabel: UILabel = Components.formLabel(text: "Home Payments")
    let carpaymentLabel: UILabel = Components.formLabel(text: "Car Payments")
    let businesspaymentLabel: UILabel = Components.formLabel(text: "Business Payments")
    
    let calculateButton: UIButton = Components.butonElement(title: "Calculate")
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = GlobalData.navigationMainColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes  = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Zakat Calculator"
        
        setupScrollView()
        setupViews()
        numericKeybordSetup()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleGesture(gesture:)))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(backAction), imageName: "back1")
        calculateButton.addTarget(self, action: #selector(zakatResults), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
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
    
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor.white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    
    func setupViews(){
        
        goldandsilverLabel.font = Font.large02
        goldandsilverLabel.backgroundColor = GlobalData.greenColor
        
        cashandpropertyLabel.font = Font.large02
        cashandpropertyLabel.backgroundColor = GlobalData.skyBlueColor
        
        debtsandliabilitiesLabel.font = Font.large02
        debtsandliabilitiesLabel.backgroundColor = GlobalData.creamRedColor
        
        contentView.addSubview(goldandsilverLabel)
        contentView.addSubview(goldTextFiled)
        contentView.addSubview(silverTextFiled)
        contentView.addSubview(goldLabel)
        contentView.addSubview(silverLabel)
        
        contentView.addSubview(cashandpropertyLabel)
        contentView.addSubview(cashinhandTextFiled)
        contentView.addSubview(cashinbankTextFiled)
        contentView.addSubview(cashinbusinessTextFiled)
        contentView.addSubview(rentalincomeTextFiled)
        contentView.addSubview(propertvalueTextFiled)
        contentView.addSubview(stocksTextFiled)
        
        contentView.addSubview(cashinhandLabel)
        contentView.addSubview(cashinbankLabel)
        contentView.addSubview(cashinbusinessLabel)
        contentView.addSubview(rentalincomeLabel)
        contentView.addSubview(propertvalueLabel)
        contentView.addSubview(stocksLabel)
        
        contentView.addSubview(debtsandliabilitiesLabel)
        contentView.addSubview(debtstofamilyTextFiled)
        contentView.addSubview(debtstoothersTextFiled)
        contentView.addSubview(creditcardpaymentsTextFiled)
        contentView.addSubview(homepaymentTextFiled)
        contentView.addSubview(carpaymentTextFiled)
        contentView.addSubview(businesspaymentTextFiled)
        
        contentView.addSubview(debtstofamilyLabel)
        contentView.addSubview(debtstoothersLabel)
        contentView.addSubview(creditcardpaymentsLabel)
        contentView.addSubview(homepaymentLabel)
        contentView.addSubview(carpaymentLabel)
        contentView.addSubview(businesspaymentLabel)
        
        contentView.addSubview(calculateButton)
        
        let constraints = [
            
            goldandsilverLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            goldandsilverLabel.heightAnchor.constraint(equalToConstant: 40),
            
            goldTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 50),
            goldTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            goldTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40),
            goldTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            goldLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 50),
            goldLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            goldLabel.heightAnchor.constraint(equalToConstant: 30),
            
            silverTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 90),
            silverTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            silverTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            silverTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            silverLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 90),
            silverLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            silverLabel.heightAnchor.constraint(equalToConstant: 30),
            
            cashandpropertyLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 130),
            cashandpropertyLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            cashandpropertyLabel.heightAnchor.constraint(equalToConstant: 40),
            
            cashinhandTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 180),
            cashinhandTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            cashinhandTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            cashinhandTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            cashinhandLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 180),
            cashinhandLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            cashinhandLabel.heightAnchor.constraint(equalToConstant: 30),
            
            cashinbankTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 220),
            cashinbankTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            cashinbankTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            cashinbankTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            cashinbankLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 220),
            cashinbankLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            cashinbankLabel.heightAnchor.constraint(equalToConstant: 30),
            
            cashinbusinessTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 260),
            cashinbusinessTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            cashinbusinessTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            cashinbusinessTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            cashinbusinessLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 260),
            cashinbusinessLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            cashinbusinessLabel.heightAnchor.constraint(equalToConstant: 30),
            
            rentalincomeTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 300),
            rentalincomeTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            rentalincomeTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            rentalincomeTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            rentalincomeLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 300),
            rentalincomeLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            rentalincomeLabel.heightAnchor.constraint(equalToConstant: 30),
            
            propertvalueTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 340),
            propertvalueTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            propertvalueTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            propertvalueTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            propertvalueLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 340),
            propertvalueLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            propertvalueLabel.heightAnchor.constraint(equalToConstant: 30),
            
            stocksTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 380),
            stocksTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            stocksTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            stocksTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            stocksLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 380),
            stocksLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            stocksLabel.heightAnchor.constraint(equalToConstant: 30),
            
            debtsandliabilitiesLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 420),
            debtsandliabilitiesLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            debtsandliabilitiesLabel.heightAnchor.constraint(equalToConstant: 40),
            
            debtstofamilyTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 470),
            debtstofamilyTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            debtstofamilyTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            debtstofamilyTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            debtstofamilyLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 470),
            debtstofamilyLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            debtstofamilyLabel.heightAnchor.constraint(equalToConstant: 30),
            
            debtstoothersTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 510),
            debtstoothersTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            debtstoothersTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            debtstoothersTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            debtstoothersLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 510),
            debtstoothersLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            debtstoothersLabel.heightAnchor.constraint(equalToConstant: 30),
            
            creditcardpaymentsTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 550),
            creditcardpaymentsTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            creditcardpaymentsTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            creditcardpaymentsTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            creditcardpaymentsLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 550),
            creditcardpaymentsLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            creditcardpaymentsLabel.heightAnchor.constraint(equalToConstant: 30),
            
            homepaymentTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 590),
            homepaymentTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            homepaymentTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            homepaymentTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            homepaymentLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 590),
            homepaymentLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            homepaymentLabel.heightAnchor.constraint(equalToConstant: 30),
            
            carpaymentTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 630),
            carpaymentTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            carpaymentTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            carpaymentTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            carpaymentLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 630),
            carpaymentLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            carpaymentLabel.heightAnchor.constraint(equalToConstant: 30),
            
            businesspaymentTextFiled.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 670),
            businesspaymentTextFiled.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: view.frame.width/2),
            businesspaymentTextFiled.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 40 ),
            businesspaymentTextFiled.heightAnchor.constraint(equalToConstant: 30),
            
            businesspaymentLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 670),
            businesspaymentLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            businesspaymentLabel.heightAnchor.constraint(equalToConstant: 30),
            
            calculateButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 720),
            calculateButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40),
            calculateButton.heightAnchor.constraint(equalToConstant: 40),
            calculateButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ]
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case goldTextFiled:
            silverTextFiled.becomeFirstResponder()
        case silverTextFiled:
            cashinhandTextFiled.becomeFirstResponder()
        case cashinhandTextFiled:
            cashinbankTextFiled.becomeFirstResponder()
        case cashinbankTextFiled:
            cashinbusinessTextFiled.becomeFirstResponder()
        case cashinbusinessTextFiled:
            rentalincomeTextFiled.becomeFirstResponder()
        case rentalincomeTextFiled:
            propertvalueTextFiled.becomeFirstResponder()
        case propertvalueTextFiled:
            stocksTextFiled.becomeFirstResponder()
        case stocksTextFiled:
            debtstofamilyTextFiled.becomeFirstResponder()
        case debtstofamilyTextFiled:
            debtstoothersTextFiled.becomeFirstResponder()
        case debtstoothersTextFiled:
            creditcardpaymentsTextFiled.becomeFirstResponder()
        case creditcardpaymentsTextFiled:
            homepaymentTextFiled.becomeFirstResponder()
        case homepaymentTextFiled:
            carpaymentTextFiled.becomeFirstResponder()
        case carpaymentTextFiled:
            businesspaymentTextFiled.becomeFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return false
    }
    
    func numericKeybordSetup() {
        goldTextFiled.delegate = self
        self.goldTextFiled.keyboardType = UIKeyboardType.decimalPad
        goldTextFiled.returnKeyType = .done
        
        silverTextFiled.delegate = self
        self.silverTextFiled.keyboardType = UIKeyboardType.decimalPad
        silverTextFiled.returnKeyType = .done
        
        cashinhandTextFiled.delegate = self
        self.cashinhandTextFiled.keyboardType = UIKeyboardType.decimalPad
        cashinhandTextFiled.returnKeyType = .done
        
        cashinbankTextFiled.delegate = self
        self.cashinbankTextFiled.keyboardType = UIKeyboardType.decimalPad
        cashinbankTextFiled.returnKeyType = .done
        
        cashinbusinessTextFiled.delegate = self
        self.cashinbusinessTextFiled.keyboardType = UIKeyboardType.decimalPad
        cashinbusinessTextFiled.returnKeyType = .done
        
        rentalincomeTextFiled.delegate = self
        self.rentalincomeTextFiled.keyboardType = UIKeyboardType.decimalPad
        rentalincomeTextFiled.returnKeyType = .done
        
        propertvalueTextFiled.delegate = self
        self.propertvalueTextFiled.keyboardType = UIKeyboardType.decimalPad
        propertvalueTextFiled.returnKeyType = .done
        
        stocksTextFiled.delegate = self
        self.stocksTextFiled.keyboardType = UIKeyboardType.decimalPad
        stocksTextFiled.returnKeyType = .done
        
        debtstofamilyTextFiled.delegate = self
        self.debtstofamilyTextFiled.keyboardType = UIKeyboardType.decimalPad
        debtstofamilyTextFiled.returnKeyType = .done
        
        debtstoothersTextFiled.delegate = self
        self.debtstoothersTextFiled.keyboardType = UIKeyboardType.decimalPad
        debtstoothersTextFiled.returnKeyType = .done
        
        creditcardpaymentsTextFiled.delegate = self
        self.creditcardpaymentsTextFiled.keyboardType = UIKeyboardType.decimalPad
        creditcardpaymentsTextFiled.returnKeyType = .done
        
        homepaymentTextFiled.delegate = self
        self.homepaymentTextFiled.keyboardType = UIKeyboardType.decimalPad
        homepaymentTextFiled.returnKeyType = .done
        
        carpaymentTextFiled.delegate = self
        self.carpaymentTextFiled.keyboardType = UIKeyboardType.decimalPad
        carpaymentTextFiled.returnKeyType = .done
        
        businesspaymentTextFiled.delegate = self
        self.businesspaymentTextFiled.keyboardType = UIKeyboardType.decimalPad
        businesspaymentTextFiled.returnKeyType = .done
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
        var info = notification.userInfo
        let keyBoardSize = info![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        scrollView.contentInset = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyBoardSize.height, right: 0.0)
        scrollView.scrollIndicatorInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyBoardSize.height, right: 0.0)
    }
    
    @objc func keyboardDidHide(notification: NSNotification) {
        
        scrollView.contentInset = UIEdgeInsets.zero
        scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
    }
    
    func zakatCalculate() -> Double {
        var zakatValue: Double
        ZakatInput.details.gold = Double(goldTextFiled.text!) ?? 0.0
        ZakatInput.details.silver = Double(silverTextFiled.text!) ?? 0.0
        ZakatInput.details.cashinbank = Double(cashinbankTextFiled.text!) ?? 0.0
        ZakatInput.details.cashinbank = Double(cashinbankTextFiled.text!) ?? 0.0
        ZakatInput.details.cashinbusiness = Double(cashinbusinessTextFiled.text!) ?? 0.0
        ZakatInput.details.rentalincome = Double(rentalincomeTextFiled.text!) ?? 0.0
        ZakatInput.details.propertvalue = Double(propertvalueTextFiled.text!) ?? 0.0
        ZakatInput.details.stockvalue = Double(stocksTextFiled.text!) ?? 0.0
        ZakatInput.details.debtstofamily = Double(debtstofamilyTextFiled.text!) ?? 0.0
        ZakatInput.details.debtstoothers = Double(debtstoothersTextFiled.text!) ?? 0.0
        ZakatInput.details.carpayment = Double(carpaymentTextFiled.text!) ?? 0.0
        ZakatInput.details.homepayment = Double(homepaymentTextFiled.text!) ?? 0.0
        ZakatInput.details.creditcardpayments = Double(creditcardpaymentsTextFiled.text!) ?? 0.0
        ZakatInput.details.businesspayment = Double(businesspaymentTextFiled.text!) ?? 0.0
        
        zakatValue = (ZakatInput.details.gold + ZakatInput.details.silver + ZakatInput.details.cashinbank + ZakatInput.details.cashinbusiness +
                     ZakatInput.details.rentalincome + ZakatInput.details.propertvalue + ZakatInput.details.stockvalue) -
                     (ZakatInput.details.debtstofamily + ZakatInput.details.debtstoothers + ZakatInput.details.carpayment +
                      ZakatInput.details.homepayment +   ZakatInput.details.creditcardpayments +   ZakatInput.details.businesspayment)
        
        return zakatValue * 0.025
    }
    
    @objc func zakatResults() {
        let zakatresult: Double = zakatCalculate()
        var message: String = "Please pay Zakat of value $ \(zakatresult) to poor and needy"
        
        if zakatresult <=  0.0 {
            message = "You do not need to pay Zakat for this year. However, do charity as much as you can during this holy month"
        }
        
        if goldTextFiled.text == nil {
            
            message = "Please key in valid input"
        }
        
        let ac = UIAlertController(title: "Zakat for this Year", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(ac, animated: true)
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
