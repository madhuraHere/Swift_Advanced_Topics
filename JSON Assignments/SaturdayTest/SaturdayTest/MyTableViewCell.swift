//
//  MyTableViewCell.swift
//  SaturdayTest
//
//  Created by Mac on 23/03/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var txtID: UILabel!
    
    
    @IBOutlet weak var txtname: UILabel!
    
    
    
    @IBOutlet weak var txtphone: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
