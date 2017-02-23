//
//  ContactDetailsViewController.swift
//  miller_addressBook
//
//  Created by Miller, Garrett (millegt) on 10/29/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmailAddress: UILabel!
    
    var contact = Contact()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblFirstName.text = contact.firstName
        lblLastName.text = contact.lastName
        lblEmailAddress.text = contact.emailAddress
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
