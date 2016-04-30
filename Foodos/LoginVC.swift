//
//  LoginVC.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/04/29.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey(KEY_UID) != nil {
            self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
        }
    }
    @IBAction func attempLogin(sender: UIButton!) {
        
        if let email = emailField.text where email != "", let pwd = passwordField.text where pwd != "" {
            
            DataServicesFirebase.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                
                if error != nil {
                    print(error.code)
                    
                    if error.code == INVALID_EMAIL && error.code == INVALID_PASSWORD {
                        DataServicesFirebase.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { error, authData in
                            
                            if error != nil {
                                self.showErrorAlert("Incorrect email Address", msg: "Please check your email address")
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue([KEY_UID], forKey: KEY_UID)
                                self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                            }
                        })
                    }
                    
                    if error.code == STATUS_ACCOUNT_NONEXIST {
                        DataServicesFirebase.ds.REF_BASE.createUser(email, password: pwd, withValueCompletionBlock: { error, result in
                            
                            if error  != nil {
                                self.showErrorAlert("Could not create account", msg: "Problem creating account. Try something else")
                                
                            } else {
                                NSUserDefaults.standardUserDefaults().setValue(result [KEY_UID], forKey: KEY_UID)
                                DataServicesFirebase.ds.REF_BASE.authUser(email, password: pwd, withCompletionBlock: { err, authData in
                                    
                                    let user = ["provider": authData.provider!]
                                    DataServicesFirebase.ds.createFirebaseUser(KEY_UID, user: user)
                                })
                                self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                            }
                        })
                        
                    } else {
                        
                        self.showErrorAlert("Could not login", msg: "Please check username or password")
                    }
                } else {
                    self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
            })
        } else {
            showErrorAlert("Email and password required", msg: "You must email and a password")
        }
        
    }
    @IBAction func fbBtnPressed(sender: UIButton!) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logInWithReadPermissions(["email"]) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) in
            
            if facebookError != nil {
                print("Facebook login failed.Error \(facebookError)")
            } else if facebookResult.isCancelled {
                print("Facebook login was cancelled")
            } else {
                let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
                print("Successfully logged in with facebook. \(accessToken)")
                
                DataServicesFirebase.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { error, authData in
                    
                    if error != nil {
                        print("Login failed. \(error)")
                    } else {
                        print("Logged in \(authData)")
                        NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                        
                        let user = ["provider": authData.provider!, "blah":"Test"]
                        DataServicesFirebase.ds.createFirebaseUser(authData.uid, user: user)
                        self.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                    }
                })
            }
        }
    }
    func showErrorAlert(title: String, msg: String) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
    }


}
