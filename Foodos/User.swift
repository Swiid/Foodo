//
//  User.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/04/30.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import Foundation

class User {
    
    private var _firstName: String?
    private var _lastName: String?
    private var _username: String!
    private var _emailAddress: String!
    
    var firstName: String? {
        return _firstName
    }
    var lastname: String? {
        return _lastName
    }
    var username: String {
        return _username
    }
    var emailAddress: String {
        return _emailAddress
    }
    init(firstName: String?, lastname: String?, username: String, emailAddress: String) {
        self._firstName = firstName
        self._lastName = lastname
        self._emailAddress = emailAddress
        self._username = username
    }
}