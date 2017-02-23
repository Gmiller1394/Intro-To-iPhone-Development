//
//  ViewController.swift
//  Miller_Color_Palette
//
//  Created by Miller, Garrett (millegt) on 9/8/15.
//  Copyright (c) 2015 Miller, Garrett (millegt). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var colorCanvas: UIView!
    @IBOutlet weak var sliderRed: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func changeColor(sender: AnyObject) {
        /*
            1. retrieve the value from the slider
            2. construct a new color using the slider value
            3. set the new color as the background color for the colorCanvas view
        */
        
        let redValue = sliderRed.value
        let newColor = UIColor(red: redValue, green: Float(0.0), blue: Float(0.0), alpha: Float(1.0))
        colorCanvas.backgroundColor = newColor
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

