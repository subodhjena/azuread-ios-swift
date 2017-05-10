//
//  Task.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

struct Task {
    
    public var description : String?
}

extension Task {
    
    init(description: String) {
        
        self.description = description
    }
}
