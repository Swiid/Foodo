//
//  MyRecipesCell.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/05/01.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit

class MyRecipesCell: UITableViewCell {
    
    @IBOutlet weak var recipeListImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureRecipeCell(img: UIImage) {
        
        recipeListImg.image = UIImage(named: "\(img)")
        
    }

}
