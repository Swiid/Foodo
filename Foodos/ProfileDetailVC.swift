//
//  ProfileDetailVC.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/04/30.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit

class ProfileDetailVC: UIViewController {
    
    @IBOutlet weak var userNameTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var lastnameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var saveProfileBtn: UIButton!
    
    @IBOutlet weak var userEditTextfields: UIStackView!
    
    
    var user = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    func showUserEditfields() {
        userEditTextfields.hidden = false
        saveProfileBtn.hidden = false
    }
    @IBAction func editBtnTapped(sender: UIButton) {
        showUserEditfields()
        
    }
    @IBAction func attempUserEditSave(sender: AnyObject) {
        
        
    }
    @IBAction func backBtnTapped(sender: UIButton!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
