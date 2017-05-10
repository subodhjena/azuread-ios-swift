//
//  HomeViewController.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
        
        let actionSheet: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        
        let addUserButton = UIAlertAction(title: "Add User", style: .default)
        { _ in
            
        }
        
        let addTaskButton = UIAlertAction(title: "Add Task", style: .default)
        { _ in
            self.performSegue(withIdentifier: "TaskSegue", sender: self)
        }
        
        actionSheet.addAction(cancelButton)
        actionSheet.addAction(addUserButton)
        actionSheet.addAction(addTaskButton)
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rows: Int = 0
        
        if(section == 0){
            rows = 2
        }
        else if (section == 1) {
            rows = 10
        }
        
        return rows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if(indexPath.section == 0){
            
            cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserTableViewCell
        }
        else if(indexPath.section == 1){
            cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskTableViewCell
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title: String = ""
        
        if(section == 0){
            title = "Users"
        }
        else if (section == 1) {
            title = "Tasks"
        }
        
        return title
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
