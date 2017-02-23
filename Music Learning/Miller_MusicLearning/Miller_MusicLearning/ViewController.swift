//
//  ViewController.swift
//  Miller_MusicLearning
//
//  Created by Miller, Garrett (millegt) on 10/6/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    var turnCounter : Int = 0
    var MAXTURN : Int = 3
    var noteURLS : NSArray!
    var player : AVAudioPlayer!
    var currentNote = String()
    var correctAnswersCounter : Int = 0
    var score : Int = 0
    
    
    @IBOutlet weak var btnStartGame: UIButton!
    @IBOutlet weak var lblTurnCounterFeedback: UILabel!
    @IBOutlet weak var imgCorrectAnswer: UIImageView!
    @IBOutlet weak var imgIncorrectAnswer: UIImageView!
    @IBOutlet weak var txtIncorrect: UIImageView!
    @IBOutlet weak var txtCorrect: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appBundle = NSBundle.mainBundle()
        noteURLS = appBundle.URLsForResourcesWithExtension("mp3", subdirectory: nil)!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetGame(){
        lblTurnCounterFeedback.text = ""
        correctAnswersCounter = 0
    }

    @IBAction func startGame(sender: AnyObject) {
       
        turnCounter = 0
        playGame()
        resetGame()
         btnStartGame.enabled = false
    }
    
    func resetTurn(){
        imgCorrectAnswer.alpha = 0
        imgIncorrectAnswer.alpha = 0
        txtCorrect.alpha = 0
        txtIncorrect.alpha = 0
        //lblTurnCounterFeedback.text = ""
    
    }
    
    func playGame(){
        turnCounter = turnCounter + 1
        resetTurn()
        if(turnCounter <= MAXTURN){
            let randomIndex = random() % noteURLS.count
            let randomURL = noteURLS.objectAtIndex(randomIndex) as! NSURL
            player = AVAudioPlayer(contentsOfURL: randomURL, error: nil)
            player.play()
            NSLog("%@", randomURL)
            currentNote = randomURL.lastPathComponent!
        }
        else{
            score = correctAnswersCounter * 100/MAXTURN
            
            let alert = UIAlertController(title: "Game Over", message: "Your score is: \(score)", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: true, completion: nil)
            btnStartGame.enabled = true
            updateStats()
        }
    }
    
    func updateStats(){
        let sharedObject = NSUserDefaults.standardUserDefaults()
        var highestScore = sharedObject.integerForKey("HighestScore")
        var lowestScore = sharedObject.integerForKey("LowestScore")
        var numberOfGamesPlayed = sharedObject.integerForKey("NumberOfGamesPlayed")
        numberOfGamesPlayed = numberOfGamesPlayed + 1
        if(score > highestScore){
            highestScore = score
        }
        
        if(score < lowestScore){
            lowestScore = score
        }
        if(numberOfGamesPlayed == 1){
            lowestScore = score
        }
        
        sharedObject.setInteger(highestScore, forKey: "HighestScore")
        sharedObject.setInteger(lowestScore, forKey: "LowestScore")
        sharedObject.setInteger(numberOfGamesPlayed, forKey: "NumberOfGamesPlayed")
        sharedObject.setInteger(score, forKey: "RecentScore")
        
        
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        let note = sender.titleLabel?.text
        let userSelectedNote = NSString.localizedStringWithFormat("%@.mp3", note!)
        
        if(userSelectedNote == currentNote){
            imgCorrectAnswer.alpha = 1
            txtCorrect.alpha = 1
            NSLog("Correct Answer")
            correctAnswersCounter++
        }
        else{
            imgIncorrectAnswer.alpha = 1
            txtIncorrect.alpha = 1
            NSLog("Incorrect Answer")
        }
        let turnMessage = NSString.localizedStringWithFormat("Attempt %d out of %d", turnCounter, MAXTURN) as String
        lblTurnCounterFeedback.text = turnMessage
        
        NSTimer .scheduledTimerWithTimeInterval(3, target: self, selector: "playGame", userInfo: nil, repeats: false)
    }
    

}

