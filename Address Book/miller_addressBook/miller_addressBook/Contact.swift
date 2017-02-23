//
//  Contact.swift
//  miller_addressBook
/*
models the contact object for the address book project
*/
//  Created by Miller, Garrett (millegt) on 10/27/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit

class Contact: NSObject, NSCoding{
   
    var firstName : String = String()
    var lastName : String = String()
    var emailAddress = ""
    
    
    init(first userFirstName:String, last userLastName:String, email userEmailAdress:String){
        super.init()
        firstName = userFirstName
        lastName = userLastName
        emailAddress = userEmailAdress
    }
    
    override init(){
        super.init()
        firstName = "John"
        lastName = "Doe"
        emailAddress = "John.Doe@email.com"
    }
    
    
    required convenience init(coder aDecoder: NSCoder){
        self.init()
        firstName = aDecoder.decodeObjectForKey("FirstName") as! String
        lastName = aDecoder.decodeObjectForKey("LastName") as! String
        emailAddress = aDecoder.decodeObjectForKey("EmailAddress") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: "FirstName")
        aCoder.encodeObject(lastName, forKey: "LastName")
        aCoder.encodeObject(emailAddress, forKey: "EmailAddress")
    }
    
}
