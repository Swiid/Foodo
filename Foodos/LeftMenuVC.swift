//
//  LeftMenuVC.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/05/02.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var menuTiltles = ["Profile","My Recipes"]
    var menuTiltle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTiltles.count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("LeftMenuCell") as? LeftMenuCell {
            cell.configureMenuCell(menuTiltles[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.menuTiltle = self.menuTiltles[indexPath.row]
        if menuTiltle == "Profile" {
            performSegueWithIdentifier(SEGUE_PROFILE_DETAIL, sender: self)
        } else if menuTiltle == "My Recipes" {
            performSegueWithIdentifier(SEGUE_MY_RECIPES, sender: self)
        }
    }

    
}
