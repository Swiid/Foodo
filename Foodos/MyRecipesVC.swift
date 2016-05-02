//
//  MyRecipesVC.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/05/01.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit

class MyRecipesVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipeLists = ["Starters","Main Course","Desserts"]
    var recipeList = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipeLists.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("MyRecipesCell", forIndexPath: indexPath) as? MyRecipesCell {
            cell.configureRecipeCell(recipeLists[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }

    
}
