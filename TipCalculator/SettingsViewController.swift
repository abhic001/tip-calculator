//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Abhijeet Chakrabarti on 1/7/17.
//  Copyright © 2017 Abhijeet Chakrabarti. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet var tipControl: UISegmentedControl!
    var defaults = UserDefaults.standard
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func defaultValueChanged(_ sender: AnyObject) {
        
        var tipControlPercent = 0.0
        if tipControl.selectedSegmentIndex == 0 {
            tipControlPercent = 0.18
        } else if tipControl.selectedSegmentIndex == 1 {
            tipControlPercent = 0.20
        } else if tipControl.selectedSegmentIndex == 2 {
            tipControlPercent = 0.22
        }
        
        defaults.set(tipControlPercent, forKey: "TipPercent")
        
        //Not necessary for iOS8 and up
        // defaults.synchronize()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //It is important to have this here so you can synchronize the setting from main view and setting view
        let percentValue = defaults.double(forKey: "TipPercent")
        
        if percentValue == 0.18 {
            tipControl.selectedSegmentIndex = 0
            
        } else if percentValue == 0.20 {
            tipControl.selectedSegmentIndex = 1
        } else if percentValue == 0.22 {
            tipControl.selectedSegmentIndex = 2
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
