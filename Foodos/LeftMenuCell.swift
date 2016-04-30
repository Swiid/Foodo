//
//  LeftMenuCell.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/04/30.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit
import SideMenu

class LeftMenuCell: UITableViewCell {
    
    @IBOutlet weak var sideMenuTitleLbl: UILabel!
    @IBOutlet weak var sideMenuImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    func configureMenuCell(title: String) {
        
        sideMenuTitleLbl.text = title.capitalizedString
        sideMenuImg.image = UIImage(named: "\(title)")
    }

}
