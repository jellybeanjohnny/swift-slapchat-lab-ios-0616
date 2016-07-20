//
//  TableViewController.swift
//  SlapChat
//
//  Created by susan lovaglio on 7/16/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var messages: [Message] = []
    let dataStore = DataStore.sharedDataStore
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataStore.fetchData()
        messages = dataStore.messages
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        dataStore.fetchData()
        messages = dataStore.messages
        self.tableView.reloadData()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return messages.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell", forIndexPath: indexPath)
        
        let message = messages[indexPath.row]
        cell.textLabel?.text = message.content
        
        return cell
    }
    
    @IBAction func sortData(sender: AnyObject) {
        dataStore.sortedFetch()
        messages = dataStore.messages
        self.tableView.reloadData()
    }
    
    
}
