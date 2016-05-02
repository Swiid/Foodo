//
//  SearchRecipeCell.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/05/02.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit

class SearchRecipeCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    var recipe: Recipe!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configureRecipeSearchCell(recipe: Recipe) {
        titleLbl.text = recipe.title.capitalizedString
        descriptionLbl.text = recipe.shortDesc
        recipeImg.image = UIImage(named: "\(recipe.title)")
    }
    

}
