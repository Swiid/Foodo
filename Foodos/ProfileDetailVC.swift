//
//  ProfileDetailVC.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/04/30.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit
import Firebase

class ProfileDetailVC: UIViewController {
    
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var saveProfileBtn: UIButton!
    
    
    
    var user: userProfile!
    var sideMenuTitle = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        initObserver()
        
    }
    
    func initObserver() {
        DataServicesFirebase.ds.REF_USERS.observeEventType(.ChildChanged, withBlock: { snapshot in
            
            let name = snapshot.value.objectForKey("name") as? String
            print("The user has updated his name to \(name)")
            
        })
    }
  
    
    
    @IBAction func attempUserEditSave(sender: AnyObject) {
        
        updateFirebaseUser()
        
    }
    @IBAction func backBtnTapped(sender: UIBarButtonItem!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateFirebaseUser() {
        
        let users: Dictionary<String, AnyObject> = [
            "name":nameTextfield.text!,
            "lastname":lastnameTextfield.text!,
            "email":emailTextfield.text!,
            "username":userNameTextfield.text!
            ]
            let updateUser = DataServicesFirebase.ds.REF_USERS.childByAppendingPath(KEY_UID)
            updateUser.updateChildValues(users)
        
        
    }
        
        
 
    
}
