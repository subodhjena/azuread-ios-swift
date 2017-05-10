//
//  SettingsViewController.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit
import Eureka

class SettingsViewController: FormViewController {

    // MARK: - Form Tags
    
    private let tagAuthority = "authority"
    private let tagClientID = "clientId"
    private let tagResource = "resource"
    private let tagRedirectURI = "redirectURI"
    private let tagFullScreen = "fullScreen"
    private let tagShowClaims = "showClaims"
    private let tagCorID = "corID"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createForm()
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Form
    
    private func createForm() {
        
        form +++ Section("Azure AD Configuration")
            <<< TextRow(){ row in
                row.title = "Authority"
                row.tag = tagAuthority
                row.placeholder = "Authority"
            }
            <<< TextRow(){ row in
                row.title = "Client ID"
                row.tag = tagClientID
                row.placeholder = "Client ID"
            }
            <<< TextRow(){ row in
                row.title = "Resource"
                row.tag = tagResource
                row.placeholder = "Resource"
            }
            <<< TextRow(){ row in
                row.title = "Redirect URI"
                row.tag = tagRedirectURI
                row.placeholder = "Redirect URI"
            }
            <<< SwitchRow("Full Screen"){
                $0.title = $0.tag
                $0.tag = tagFullScreen
            }
            <<< SwitchRow("Show Claims"){
                $0.title = $0.tag
                $0.tag = tagShowClaims
            }
            <<< TextRow(){ row in
                row.title = "Co-Relation ID"
                row.placeholder = "Co-Relation ID"
                row.tag = tagCorID
            }
    }
    
    private func loadData() {
        
        let configValues = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ADConfig", ofType: "plist")!)
        let config = Config(dictionary: configValues as! Dictionary<String, Any>)
        
        let rowAuthority: TextRow? = form.rowBy(tag: self.tagAuthority)
        rowAuthority?.value = config.authority
        
        let rowClientID: TextRow? = form.rowBy(tag: self.tagClientID)
        rowClientID?.value = config.clientId
        
        let rowResource: TextRow? = form.rowBy(tag: self.tagResource)
        rowResource?.value = config.resourceString
        
        let rowRedirectURI: TextRow? = form.rowBy(tag: self.tagRedirectURI)
        rowRedirectURI?.value = config.redirectUri
        
        let rowFullScreen: SwitchRow? = form.rowBy(tag: self.tagFullScreen)
        rowFullScreen?.value = config.fullScreen
        
        let rowShowClaims: SwitchRow? = form.rowBy(tag: self.tagShowClaims)
        rowShowClaims?.value = config.showClaims
        
        let rowCorID: TextRow? = form.rowBy(tag: self.tagCorID)
        rowCorID?.value = config.correlationId
    }
    
    // MARK: - Navigation
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 
    }
}
