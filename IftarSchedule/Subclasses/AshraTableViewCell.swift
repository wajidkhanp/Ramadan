//
//  AshraTableViewCell.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class AshraTableViewCell: UITableViewCell {
    
    let day: UILabel = Components.ashraCellLable()
    let seher: UILabel = Components.ashraCellLable()
    let iftar: UILabel = Components.ashraCellLable()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(day)
        contentView.addSubview(seher)
        contentView.addSubview(iftar)
        
        day.font = Font.standard01
        seher.font = Font.standard01
        iftar.font = Font.standard01
        
        day.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        day.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        day.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3 + 20).isActive = true
        
        seher.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: (contentView.frame.width/3)*2 - 70).isActive = true
        seher.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        seher.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
        
        iftar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: (contentView.frame.width / 3)*3 - 50).isActive = true
        iftar.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        iftar.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3).isActive = true
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func round(corners: UIRectCorner, withRadius radius: CGFloat) {
        let mask = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.frame = self.bounds
        shape.path = mask.cgPath
        self.layer.mask = shape
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding = UIEdgeInsets(top: 2.5, left: 5, bottom: 2.5, right: 5)
        bounds = bounds.inset(by: padding)
    }
}

