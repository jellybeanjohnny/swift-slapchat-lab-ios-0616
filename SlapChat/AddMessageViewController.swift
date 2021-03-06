//
//  AddMessageViewController.swift
//  SlapChat
//
//  Created by Matt Amerige on 7/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import CoreData

class AddMessageViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
     
        if textfield.text?.characters.count == 0 { return }
        
        let managedContext = DataStore.sharedDataStore.managedObjectContext
//        guard let messageEntity = NSEntityDescription.entityForName("Message", inManagedObjectContext: managedContext) else { return }
//        
//        let newMessage = Message(entity: messageEntity, insertIntoManagedObjectContext: managedContext)
//        newMessage.content = textfield.text
//        newMessage.createdAt = NSDate()
        
        let message = NSEntityDescription.insertNewObjectForEntityForName(Message.entityName, inManagedObjectContext: managedContext) as! Message
        message.content = textfield.text
        message.createdAt = NSDate()
        
        
        DataStore.sharedDataStore.saveContext()
        
        dismissViewControllerAnimated(true, completion: nil)
    }

}
