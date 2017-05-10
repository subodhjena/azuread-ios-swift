//
//  Config.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

struct Config {
    
    public var clientId : String?
    public var authority : String?
    public var resourceString : String?
    public var redirectUri : String?
    public var taskWebAPI : String?
    public var correlationId : String?
    public var fullScreen : Bool?
    public var showClaims : Bool?
    
}

extension Config {
    
    init(dictionary: Dictionary<String, Any>) {
        
        clientId = dictionary["clientId"] as? String
        authority = dictionary["authority"] as? String
        resourceString = dictionary["resourceString"] as? String
        redirectUri = dictionary["redirectUri"] as? String
        taskWebAPI = dictionary["taskWebAPI"] as? String
        correlationId = dictionary["correlationId"] as? String
        fullScreen = dictionary["fullScreen"] as? Bool
        showClaims = dictionary["showClaims"] as? Bool
    }
}
