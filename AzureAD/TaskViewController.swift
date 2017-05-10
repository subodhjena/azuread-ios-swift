//
//  TaskViewController.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit
import Eureka

class TaskViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createForm()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Form
    
    private func createForm() {
        
        form +++ Section("Task")
            <<< TextAreaRow(){ row in
                row.title = "Task"
                row.textAreaHeight = TextAreaHeight.dynamic(initialTextViewHeight: 70)
                row.placeholder = "Task Detail"
            }
            +++ Section("Actions")
            <<< ButtonRow() {
                $0.title = "Save"
            }
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
