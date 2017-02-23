//
//  NewContactTableViewController.swift
//  miller_addressBook
//
//  Created by Miller, Garrett (millegt) on 10/29/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit

class NewContactTableViewController: UITableViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmailAddress: UITextField!
    
    var contact = Contact()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "SaveSegue"){
            contact.firstName = txtFirstName.text
            contact.lastName = txtLastName.text
            contact.emailAddress = txtEmailAddress.text
        }    
    }

}
