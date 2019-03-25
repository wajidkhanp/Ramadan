//
//  IslamicDatesTableViewCell.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/18/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class IslamicDatesTableViewCell: UITableViewCell {

    let dateLabel: UILabel = Components.cellLable()
    let evenLabel: UILabel = Components.cellLable()
    let islamicDateLabel: UILabel = Components.cellLable()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dateLabel)
        contentView.addSubview(evenLabel)
        contentView.addSubview(islamicDateLabel)
        
        dateLabel.font = Font.large02
        dateLabel.backgroundColor = GlobalData.greenColor
        dateLabel.textColor = UIColor.white
        dateLabel.textAlignment = .center
        evenLabel.font = Font.large01
        islamicDateLabel.font = Font.small
        
        dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        evenLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        evenLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        evenLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
        islamicDateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 100).isActive = true
        islamicDateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        islamicDateLabel.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
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
}
