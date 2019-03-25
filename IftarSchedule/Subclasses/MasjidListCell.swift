//
//  MasjidListCell.swift
//  IftarSchedule
//
//  Created by Wajid k Patan on 3/17/19.
//  Copyright © 2019 com.wajid. All rights reserved.
//

import UIKit

class MasjidListCell: UITableViewCell {
    
    let masjidName: UILabel = Components.cellLable()
    let masjidAddress: UILabel = Components.cellLable()
    let masjidContact: UILabel = Components.cellLable()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(masjidName)
        contentView.addSubview(masjidAddress)
        contentView.addSubview(masjidContact)
        contentView.addSubview(cellImage)
        
        masjidName.font = Font.large02
        masjidAddress.font = Font.small
        masjidContact.font = Font.small
        
        cellImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        cellImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        cellImage.widthAnchor.constraint(equalToConstant: 40).isActive = true
        cellImage.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
        masjidName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        masjidName.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        masjidName.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
        masjidAddress.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        masjidAddress.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        masjidAddress.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
        
        masjidContact.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
        masjidContact.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        masjidContact.widthAnchor.constraint(equalToConstant: contentView.frame.width).isActive = true
       
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

    var cellImage: UIImageView = {
        var imageview = UIImageView()
        imageview.contentMode = UIView.ContentMode.scaleAspectFill
        imageview.backgroundColor = UIColor.white
        imageview.translatesAutoresizingMaskIntoConstraints = false
        return imageview
    }()
}
