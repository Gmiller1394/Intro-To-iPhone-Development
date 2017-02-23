//
//  ViewController.swift
//  Miller_UnitConverter
//
//  Created by Miller, Garrett (millegt) on 9/22/15.
//  Copyright (c) 2015 University of Cincinnati. All rights reserved.
//

import UIKit



class ViewController: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate{

    var unitsList : NSDictionary!
    var unitNames : NSArray!
    @IBOutlet weak var txtAmount: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var pvUnitFrom: UIPickerView!
    @IBOutlet weak var pvUnitTo: UIPickerView!
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return unitNames.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        let title = unitNames.objectAtIndex(row) as! String
        return title
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //load the units
        
        let appBundle = NSBundle.mainBundle()
        let filePath = appBundle.pathForResource("unitsList", ofType: "plist")!
        unitsList = NSDictionary(contentsOfFile: filePath)!
        unitNames = unitsList.allKeys as NSArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func btnConvert() {
        let amountAsString = txtAmount.text
        let numberHelper = NSNumberFormatter()
        let amountAsNumber = numberHelper.numberFromString(amountAsString)!
        let amount = amountAsNumber.floatValue
        let indexFrom = pvUnitFrom.selectedRowInComponent(0)
        let unitFrom = unitNames.objectAtIndex(indexFrom) as! String
        let indexTo = pvUnitTo.selectedRowInComponent(0)
        let unitTo = unitNames.objectAtIndex(indexTo) as! String
        
        var result : Float = 0.0
        if(unitFrom == "feet"){
            if(unitTo == "inch"){
                result = amount * 12
            }
        }
        
        let resultsAsString = String.localizedStringWithFormat(".2f %@ = %.2f %@", amount, unitFrom, result, unitTo)
        lblResult.text = resultsAsString
        
        
        
    }
    
    

}

