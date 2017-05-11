//
//  Task.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

struct Task {
    
    public var itemName : String?
    public var ownerName : String?
    public var completed : Bool?
    private var creationDate : Date?
}

extension Task {
    
    init(itemName: String, ownerName: String, completed: Bool) {
        
        self.itemName = itemName
        self.ownerName = ownerName
        self.completed = completed
    }
}
