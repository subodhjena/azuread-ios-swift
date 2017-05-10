//
//  HomeViewController.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

    @IBAction func didTapSettings(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SettingsSegue", sender: self)
    }
    
    @IBAction func didTapAddTask(_ sender: Any) {
        self.performSegue(withIdentifier: "TaskSegue", sender: self)
    }
}
