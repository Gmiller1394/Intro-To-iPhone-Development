//
//  StatsViewController.swift
//  Miller_MusicLearning
//
//  Created by Miller, Garrett (millegt) on 10/22/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController {

    @IBOutlet weak var lblHighestScore: UILabel!
    @IBOutlet weak var lblLowestScore: UILabel!
    @IBOutlet weak var lblNumberofGames: UILabel!
    @IBOutlet weak var lblRecentScore: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sharedObject = NSUserDefaults.standardUserDefaults()
        let highestScore = sharedObject.integerForKey("HighestScore")
        let lowestScore = sharedObject.integerForKey("LowestScore")
        let recentScore = sharedObject.integerForKey("RecentScore")
        let numberOfGamesPlayed = sharedObject.integerForKey("NumberOfGamesPlayed")
        
        lblHighestScore.text = "Highest Score = \(highestScore)"
        lblLowestScore.text = "Lowest Score = \(lowestScore)"
        lblNumberofGames.text = "Number of Games Played = \(numberOfGamesPlayed)"
        lblRecentScore.text = "Recent Score = \(recentScore)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
