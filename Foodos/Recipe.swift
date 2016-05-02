//
//  Recipe.swift
//  Foodos
//
//  Created by Jacques Wud on 2016/05/02.
//  Copyright © 2016 Jacques Wud. All rights reserved.
//

import Foundation

class Recipe {
    
    private var _title: String!
    private var _type: String!
    private var _image: String!
    private var _recipeIdex: Int!
    private var _ingredients: String!
    private var _shortDesc: String!
    
    var shortDesc: String {
        get {
            if _shortDesc == "" {
                return ""
            }
            return _shortDesc
        }
    }
    var title: String {
        return _title
    }
    var type: String {
        get {
            if _type == "" {
            return ""
            }
            return _type
        }
    }
    var recipeIdex: Int {
        return _recipeIdex
    }
    var image: String {
      return _image
        
    }
    
    init(name: String, recipeIdex: Int) {
        self._title = name
        self._recipeIdex = recipeIdex
    }
}