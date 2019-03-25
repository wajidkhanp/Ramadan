//
//  DashboardHeader.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class DashboardHeader: UICollectionViewCell  {
    
    override init(frame: CGRect)    {
        super.init(frame: frame)
        setupHeaderViews()
    }
    
    let mainHeadingLabel: UILabel = Components.mainHeadingLable(text: "")
    let bismillaLabel: UILabel = Components.mainHeadingLable(text: "")
    
    let subHeadingLabel: UILabel = Components.subHeadingLabel(text: "")
    let subHeadingLabe2: UILabel = Components.subHeadingLabel(text: "")
    let subHeadingLabe3: UILabel = Components.subHeadingLabel(text: "")
    
    let fazar: UILabel = Components.subHeadingLabel(text: "")
    let sunrise: UILabel = Components.subHeadingLabel(text: "")
    let zohar: UILabel = Components.subHeadingLabel(text: "")
    let asar: UILabel = Components.subHeadingLabel(text: "")
    let magrib: UILabel = Components.subHeadingLabel(text: "")
    let isha: UILabel = Components.subHeadingLabel(text: "")
    
    let view = UIView(frame: CGRect(x: 40, y: 160, width: UIScreen.main.bounds.size.width - 80, height: 220))
    
    func setupHeaderViews()   {
        addSubview(mainHeadingLabel)
        addSubview(bismillaLabel)
        addSubview(subHeadingLabel)
        addSubview(subHeadingLabe2)
        addSubview(view)
        
        view.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        view.layer.borderColor = UIColor.clear.cgColor
        view.layer.borderWidth = 4
        view.layer.cornerRadius = 8
        
        fazar.font = Font.standard02
        sunrise.font = Font.standard02
        zohar.font = Font.standard02
        asar.font = Font.standard02
        magrib.font = Font.standard02
        isha.font = Font.standard02
        
        
         view.addSubview(subHeadingLabe3)
         view.addSubview(fazar)
         view.addSubview(sunrise)
         view.addSubview(zohar)
         view.addSubview(asar)
         view.addSubview(magrib)
         view.addSubview(isha)
        
        
        mainHeadingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        mainHeadingLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        mainHeadingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        bismillaLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        bismillaLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        bismillaLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        subHeadingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 70).isActive = true
        subHeadingLabel.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        subHeadingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        subHeadingLabe2.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        subHeadingLabe2.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
        subHeadingLabe2.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        subHeadingLabe3.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        subHeadingLabe3.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        subHeadingLabe3.heightAnchor.constraint(equalToConstant: 20).isActive = true

        fazar.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        fazar.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        fazar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        sunrise.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        sunrise.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        sunrise.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        zohar.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        zohar.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        zohar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        asar.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        asar.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        asar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        magrib.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        magrib.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        magrib.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        isha.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        isha.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        isha.heightAnchor.constraint(equalToConstant: 20).isActive = true
      
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



