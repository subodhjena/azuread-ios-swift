//
//  User.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

struct User {
    
    public var name : String?
    public var email : String?
}

extension User {
    
    init(name: String, email: String) {
        
        self.name = name
        self.email = email
    }
}
