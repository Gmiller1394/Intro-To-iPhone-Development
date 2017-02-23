//
//  helpViewController.swift
//  Miller_MusicLearning
//
//  Created by Miller, Garrett (millegt) on 10/6/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit
import AVFoundation

class helpViewController: UIViewController {

    var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func playNote(sender: UIButton) {
        let fileName = sender.titleLabel?.text
        let appBundle = NSBundle.mainBundle()
        let fileURL = appBundle.URLForResource(fileName!, withExtension: "mp3")!
        player = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        player.play()
        
        
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
