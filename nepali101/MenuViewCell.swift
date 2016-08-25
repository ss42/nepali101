//
//  MenuViewCell.swift
//  nepali101
//
//  Created by Sanjay Shrestha on 8/9/16.
//  Copyright © 2016 Dreams and Ideas. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {

    @IBOutlet weak var menu: UILabel!
    @IBOutlet weak var button1: UILabel!
    @IBOutlet weak var button2: UILabel!
    @IBOutlet weak var button3: UILabel!
    
    //@IBOutlet weak var heightConstraintSecondView: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    /*var showsDetails = false {
        didSet {
            heightConstraintSecondView.priority = showsDetails ? 250 : 999
        }
    }
    */
}
