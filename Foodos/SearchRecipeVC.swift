//
//  SearchRecipeVC.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/05/02.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit

class SearchRecipeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var recipes = [Recipe]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        parseRecipeCSV()
    }
    
    func parseRecipeCSV() {
        let path = NSBundle.mainBundle().pathForResource("spar_recipe", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let recipeId = Int(row["id"]!)!
                let name = row["title"]!
                let recip = Recipe(name: name, recipeIdex: recipeId)
                recipes.append(recip)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("SearchRecipeCell", forIndexPath: indexPath) as? SearchRecipeCell {
            
            var recip: Recipe?
            
            cell.configureRecipeSearchCell(recip!)
            return cell
        } else {
            return UITableViewCell()
        }
    }



}
