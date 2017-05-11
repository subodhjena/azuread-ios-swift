//
//  HomeViewController.swift
//  AzureAD
//
//  Created by Subodh Jena on 5/10/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit
import ADAL

class HomeViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var tasks : [Task] = []
    var users : [ADUserInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "TaskSegue") {
            
            let taskVC = segue.destination as! TaskViewController
            taskVC.parentVC = self
        }
        
    }

    @IBAction func didTapSettings(_ sender: Any) {
        
        self.performSegue(withIdentifier: "SettingsSegue", sender: self)
    }
    
    @IBAction func didTapAddTask(_ sender: Any) {
        
        let actionSheet: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in }
        
        let addUserButton = UIAlertAction(title: "Add User", style: .default) { _ in
            
            WebAPIConnector.sharedInstance.login(prompt: true, parent: self, completion: { (userInfo, error) in
                
                let configValues = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "ADConfig", ofType: "plist")!)
                let config = Config(dictionary: configValues as! Dictionary<String, Any>)
                
                
                if((userInfo != nil) && config.showClaims!) {
                    
                    self.users.append(userInfo!)
                    self.tableView.reloadData()
                }
                else if ((userInfo) != nil){
                    
                    self.users.append(userInfo!)
                    self.tableView.reloadData()
                }
                else {
                    
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription , preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
        
        let addTaskButton = UIAlertAction(title: "Add Task", style: .default) { _ in
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
            rows = users.count
        }
        else if (section == 1) {
            rows = tasks.count
        }
        
        return rows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if(indexPath.section == 0){
            
            let userCell =  tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserTableViewCell
            userCell.setUpCell(userInfo: users[indexPath.row])
            return userCell
        }
        else if(indexPath.section == 1){
            
            let taskCell =  tableView.dequeueReusableCell(withIdentifier: "TaskCell") as! TaskTableViewCell
            taskCell.setUpCell(task: tasks[indexPath.row])
            return taskCell
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
        
        if(indexPath.section == 1){
            let task = tasks[indexPath.row]
            let message = "Task Details:\(task.itemName!) \n\n\n Created By: \(task.ownerName!) \n\n\n Completed: \(task.completed!)"
            let alert = UIAlertController(title: "Task Details", message: message , preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
