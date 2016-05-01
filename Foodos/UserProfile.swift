//
//  UserProfile.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/05/01.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import Foundation

class userProfile {
    
    private var _firstName: String?
    private var _lastName: String?
    private var _email: String!
    private var _userKey: String!
    
    
    var firstName: String? {
        get {
            if _firstName == "" {
                return ""
            }
            return _firstName
        }
    }
    var lastName: String? {
        get {
            if _lastName == "" {
                return ""
            }
            return _lastName
        }
    }
    var email: String {
        get {
            if _email == "" {
                return ""
            }
            return _email
        }
        
    }
    
    init(name: String, lastname: String, email: String) {
        self._firstName = name
        self._lastName = lastname
        self._email = email
        
    }
    init(userKey: String, dictionary: Dictionary<String, AnyObject>) {
        self._userKey = userKey
    }
}