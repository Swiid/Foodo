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
    
    @IBOutlet weak var userDetailLbls: UIStackView!
    @IBOutlet weak var userDetailEditfields: UIStackView!
    
    var user = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showEditTextfields()
        
    }
    func showEditTextfields() {
        userDetailLbls.hidden = false
        userNameTextfield.hidden = true
    }
    func hideEditTextfields() {
        userDetailLbls.hidden = true
        userNameTextfield.hidden = false
    }

    @IBAction func editBtnTapped(sender: UIButton) {
        hideEditTextfields()
    }

}
