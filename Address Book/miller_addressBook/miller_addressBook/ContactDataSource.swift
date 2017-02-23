//
//  ContactDataSource.swift
//  miller_addressBook
//
//  Created by Miller, Garrett (millegt) on 10/27/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit

class ContactDataSource: NSObject {
   
    var contacts = NSMutableArray()
    override init(){
        super.init()
        loadContacts()
        
        
        //let sampleContact = Contact()
        //contacts.addObject(sampleContact)
        
    }
    
    
    func countOfContacts() ->Int{
        return contacts.count
    }
    
    func contactAtIndex(contactIndex index:Int) ->Contact{
        return contacts.objectAtIndex(index) as! Contact
    }
    
    func addContact(Contact newContact:Contact){
        contacts.addObject(newContact)
        saveContacts()
    }
    
    func deleteContact(Index:Int){
        contacts.removeObjectAtIndex(Index)
        saveContacts()
    }
    
    
    func moveContact(from fromIndex:Int, to toIndex:Int){
        let contactForm = contactAtIndex(contactIndex: fromIndex)
        let contactTo = contactAtIndex(contactIndex: toIndex)
        contacts.replaceObjectAtIndex(fromIndex, withObject: contactTo)
        contacts.replaceObjectAtIndex(toIndex, withObject: contactForm)
        saveContacts()
    }
    
    func getFileURL () -> NSURL{
        let fileManager = NSFileManager.defaultManager()
        let homeDir = fileManager.URLForDirectory(NSSearchPathDirectory.DocumentationDirectory, inDomain: NSSearchPathDomainMask.UserDomainMask, appropriateForURL: nil, create: true, error: nil)!
        let fileURL = homeDir.URLByAppendingPathComponent("addressBook.data")
        return fileURL
    }
    
    
    func saveContacts(){
        let fileURL = getFileURL()
        NSKeyedArchiver.archiveRootObject(contacts, toFile: fileURL.path!)
        
    }
    
    
    func loadContacts(){
        let fileURL = getFileURL()
        if(NSFileManager.defaultManager().fileExistsAtPath(fileURL.path!)){
            let contents = NSKeyedUnarchiver.unarchiveObjectWithFile(fileURL.path!) as! NSArray
            contacts.addObjectsFromArray(contents as [AnyObject])
        }else{
            let sampleContact = Contact()
            contacts.addObject(sampleContact)
            saveContacts()
        }
        
    }
    
    
    
    
    
    
    
    
}