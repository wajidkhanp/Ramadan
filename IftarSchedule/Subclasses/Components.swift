//
//  Components.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/16/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//


import Foundation
import UIKit

class Components  {
    
    static func cellLable() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .justified
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }

    static func ashraCellLable() -> UILabel {
        let label = UILabel()
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        return label
    }
    
    static func butonElement(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = UIColor.white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = Font.large02
        button.backgroundColor = GlobalData.greenColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 2
        button.titleLabel?.textAlignment = .center
        return button
    }
    
    static func liteButonElement(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.textColor = .red
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = Font.standard03
        button.backgroundColor = UIColor.lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.numberOfLines = 1
        button.titleLabel?.textAlignment = .center
        return button
    }
    
    static func checklistSwitch() -> UISwitch {
        let switchEnv = UISwitch()
        switchEnv.isOn = false
        switchEnv.thumbTintColor = UIColor.lightGray
        switchEnv.tintColor = UIColor.gray
        switchEnv.onTintColor = GlobalData.greenColor
        switchEnv.translatesAutoresizingMaskIntoConstraints = false
        return switchEnv
    }
    
    static func subHeadingLabel(text: String) ->UILabel {
        let lable = UILabel()
        lable.text = text
        lable.textColor = UIColor.white
        lable.font = Font.large02
        lable.layer.masksToBounds = true
        lable.textAlignment = .center
        lable.numberOfLines = 2
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }
    
    static func mainHeadingLable(text: String) ->UILabel {
        let lable = UILabel()
        lable.text = text
        lable.textColor = UIColor.white
        lable.font = Font.xlarge02
        lable.layer.masksToBounds = true
        lable.textAlignment = .center
        lable.numberOfLines = 2
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }
    
    static func formLabel(text: String) ->UILabel {
        let lable = UILabel()
        lable.text = text
        lable.textColor = UIColor.black
        lable.font = Font.small
        lable.layer.masksToBounds = true
        lable.textAlignment = .right
        lable.numberOfLines = 1
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }
    
    static func descriptionLable(text: String) -> UILabel{
        let lable = UILabel()
        lable.textColor = UIColor.white
        lable.layer.masksToBounds = true
        lable.textAlignment = .natural
        lable.translatesAutoresizingMaskIntoConstraints = false
        let htmlString = text
        let data = htmlString.data(using: String.Encoding.unicode)!
        let attrStr = try? NSAttributedString(
            data: data,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString.DocumentType.html],
            documentAttributes: nil)
        lable.attributedText = attrStr
        lable.font = Font.xlarge02
        return lable
    }
    
    static func learnMoreBtn() -> UIButton{
        let button = UIButton()
        button.setTitle("Learn More", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = Font.standard03
        button.backgroundColor = GlobalData.greenColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.textAlignment = .center
        return button
    }
    
    static func navigationLabel(navigationTitle: String) ->UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.clear
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = GlobalData.backgroundColor
        label.text = navigationTitle
        label.font = Font.standard02
        return label
    }
    
    static func inputTestFiled(placeHolder: String) -> UITextField {
        let textFiled  = UITextField()
        textFiled.placeholder = placeHolder
        textFiled.textAlignment = .center
        textFiled.font = Font.large02
        textFiled.layer.cornerRadius = 5
        textFiled.layer.borderWidth = 2
        textFiled.layer.borderColor = UIColor.lightGray.cgColor
        textFiled.textColor = UIColor.lightGray
        textFiled.keyboardType = .default
        textFiled.keyboardAppearance = .light
        textFiled.layer.masksToBounds = true
        textFiled.translatesAutoresizingMaskIntoConstraints = false
        return textFiled
    }
    
    static func getCardArt(imageURL: String) -> UIImageView {
        let imageV = UIImageView()
        imageV.dowloadFromServer(link: "\(imageURL)", contentMode: .scaleAspectFill)
        imageV.translatesAutoresizingMaskIntoConstraints = false
        return imageV
    }
    
    static func getSegmentedControll(items: [Any]) -> UISegmentedControl{
        let sc = UISegmentedControl(items: items)
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = GlobalData.greenColor
        sc.selectedSegmentIndex = 0
        return sc
    }
}

extension UIImageView {
    func dowloadFromServer(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    func dowloadFromServer(link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        dowloadFromServer(url: url, contentMode: mode)
    }
}

