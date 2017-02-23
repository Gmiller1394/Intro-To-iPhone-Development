//
//  AddressBookTableViewController.swift
//  miller_addressBook
//
//  Created by Miller, Garrett (millegt) on 10/27/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit

class AddressBookTableViewController: UITableViewController {

    let dataSource = ContactDataSource()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.countOfContacts()
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let cellContact = dataSource.contactAtIndex(contactIndex: indexPath.row)
        cell.textLabel?.text = cellContact.lastName
        cell.detailTextLabel?.text = cellContact.firstName
        
        return cell
    }
    
    
    @IBAction func Cancel(segue: UIStoryboardSegue){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func Save(segue:UIStoryboardSegue){
        let source  = segue.sourceViewController as! NewContactTableViewController
        let newContact = source.contact
        dataSource.addContact(Contact: newContact)
        self.tableView.reloadData()
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ContactDetailsSegue"){
            let selectedIndex = tableView.indexPathForSelectedRow()?.row
            let selectedContact = dataSource.contactAtIndex(contactIndex: selectedIndex!)
            let destination = segue.destinationViewController as! ContactDetailsViewController
            destination.contact = selectedContact
            
            
            
            
        }
        
        
        
    }


}
