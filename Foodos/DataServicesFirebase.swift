//
//  DataServicesFirebase.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/04/30.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://foodos.firebaseio.com"

class DataServicesFirebase {
    
    static let ds = DataServicesFirebase()
    
    private var _REF_BASE = Firebase(url: "\(URL_BASE)")
    private var _REF_USER = Firebase(url: "\(URL_BASE)/users")
    private var _REF_RECIPES = Firebase(url: "\(URL_BASE)/recipes")
    
    var REF_RECIPES: Firebase {
        return _REF_RECIPES
    }
    var REF_BASE: Firebase {
        return _REF_BASE
    }
    var REF_USER: Firebase {
        return _REF_USER
    }
    func createFirebaseUser(uid: String, user: Dictionary<String, String>) {
        REF_USER.childByAppendingPath(uid).setValue(user)
    }
    
    
}