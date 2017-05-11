//
//  WebAPIConnector.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/11/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import ADAL

class WebAPIConnector {
    
    static let sharedInstance = WebAPIConnector()
    private init() {}
    
    var authContext: ADAuthenticationContext!
    
    func login(prompt: Bool, parent: UIViewController, completion: @escaping (_ userInfo: ADUserInformation?, _ error: NSError?) -> Void ) {
     
        self.getClaims(clearCahe: false, parent: parent) { (userInfo, error) in
            
            if(userInfo == nil){
                completion(nil, error)
            }
            else {
                completion(userInfo, nil)
            }
        }
    }
    
    func logout() {
        
        if(authContext != nil) {
            
        }
    }
    
    func getClaims(clearCahe: Bool, parent: UIViewController, completion: @escaping (_ userInfo: ADUserInformation?, _ error: NSError?) -> Void) {
        
        let configValues = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ADConfig", ofType: "plist")!)
        let config = Config(dictionary: configValues as! Dictionary<String, Any>)
        
        authContext = ADAuthenticationContext(authority: config.authority, error: nil)
        authContext.parentController = parent
        
        let redirectUri = NSURL(string: config.redirectUri!)
        
        // Check if this is empty or nil
        //if(config.correlationId != nil || !(config.correlationId?.isEmpty)!) {
            //authContext.correlationId = NSUUID(uuidString: config.correlationId!)! as UUID
        //}
        
        ADAuthenticationSettings.sharedInstance().enableFullScreen = config.fullScreen!
        
        authContext.acquireToken(withResource: config.resourceString, clientId: config.clientId, redirectUri: redirectUri! as URL!, promptBehavior: AD_PROMPT_ALWAYS, userId: nil, extraQueryParameters: "nux=1") { (result) in
            
            if(result?.status != AD_SUCCEEDED)
            {
                completion(nil, result?.error)
            }
            else
            {
                // data.userItem = result.tokenCacheStoreItem;
                completion((result?.tokenCacheItem.userInformation)!, nil)
            }
        }
    }
}
