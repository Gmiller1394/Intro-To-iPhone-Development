//
//  ViewController.swift
//  Miller_TodayQuotes
//
//  Created by Miller, Garrett (millegt) on 8/25/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
    @IBOutlet weak var lbl_Quote: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appbundle = NSBundle.mainBundle()
        let filepath = appbundle.pathForResource("quotes", ofType: "plist")!
        
        let quotes = NSArray(contentsOfFile: filepath)!
        let count = quotes.count
        let index = Int(arc4random_uniform(UInt32(count)))
        //let index = random()%quotes.count
        let selectedQuote = quotes.objectAtIndex(index) as! String
        
        lbl_Quote.text = selectedQuote
        
        
        
        /*
        1. get a reference to the file
        1.1. get a reference to the app bundle (folder)
        (how to get a reference to the app bundle)
        what library can get me a reference to the app bundle
        1.2. use the directory to get a reference to the file
        2. load the contents of the file to a collection type (class) in memory
        3. select an index from the collection
        4. retrieve the quote that corresponds to the index
        5. assign the quote to the label on the story board
        
        */
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
        
    @IBAction func nextQuote() {
        super.viewDidLoad()
        let appbundle = NSBundle.mainBundle()
        let filepath = appbundle.pathForResource("quotes", ofType: "plist")!
        
        let quotes = NSArray(contentsOfFile: filepath)!
        let count = quotes.count
        let index = Int(arc4random_uniform(UInt32(count)))
        //let index = random()%quotes.count
        let selectedQuote = quotes.objectAtIndex(index) as! String
        
        lbl_Quote.text = selectedQuote

        
    }
    
    
}