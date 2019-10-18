//
//  Buy2TableViewCell.swift
//  mytest
//
//  Created by Mac on 27/03/19.
//  Copyright © 2019 Madhura. All rights reserved.
//

import UIKit

class Buy2TableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var txtmodelname: UILabel!
    
    
    @IBOutlet weak var txtcontactdetails: UILabel!
    
    @IBOutlet weak var txtyears: UILabel!
    
    
    
    
    
    @IBOutlet weak var myimage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
