//
//  LeftSideMenuVC.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/04/30.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit
import SideMenu

class LeftSideMenuVC: UITableViewController {
    
    var sideMenuTitles = [String]()
    var selectedMenu = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuTitles = ["Profile","My Recipies","Meal Planner","Grocery List"]
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sideMenuTitles.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCellWithIdentifier("LeftMenuCell", forIndexPath: indexPath) as? LeftMenuCell {
        
        // Configure the cell...
        cell.configureMenuCell(sideMenuTitles[indexPath.row])
        return cell
    
       } else {
        return UITableViewCell()
        }
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        
    }
    
    
}
