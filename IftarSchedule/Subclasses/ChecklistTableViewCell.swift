//
//  ChecklistTableViewCell.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/22/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class ChecklistTableViewCell: UITableViewCell {

    let checkListItem: UILabel = Components.cellLable()
    let checkListSwitch: UISwitch = Components.checklistSwitch()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        contentView.addSubview(checkListItem)
        //contentView.addSubview(checkListSwitch)
        
        checkListItem.font = Font.standard02
        
        checkListItem.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        checkListItem.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        checkListItem.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
        /*checkListSwitch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 20).isActive = true
        checkListSwitch.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        checkListSwitch.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        checkListSwitch.heightAnchor.constraint(equalToConstant: 30.0).isActive = true*/
    }

}
