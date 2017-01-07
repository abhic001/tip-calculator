//
//  ViewController.swift
//  TipCalculator
//
//  Created by Abhijeet Chakrabarti on 1/7/17.
//  Copyright © 2017 Abhijeet Chakrabarti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tipLabel: UILabel!
    
    @IBOutlet var billField: UITextField!
    
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var tipControl: UISegmentedControl!
    
    @IBOutlet var onePerson: UILabel!
    
    @IBOutlet var twoPerson: UILabel!
    
    
    @IBOutlet var fourPerson: UILabel!
    @IBOutlet var threePerson: UILabel!
    
    @IBOutlet var fivePerson: UILabel!
    
    @IBOutlet var numberOfPeople: UITextField!
    
    @IBOutlet var multiplePerson: UILabel!
    
    //Put the variable here since u will be reusing them throughout this view
    var doubleValue: Double?
    let defaults = UserDefaults.standard
    
    
    //This func takes in the changes from segmented control only
    @IBAction func onEditingChanged(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        defaults.set(tipPercentage, forKey: "TipPercent")
        
        //Tip result will change realtime
        loadTipResult()
    }
    
    //This func takes in the changes from bill textfield changes only
    @IBAction func billAmountChanged(_ sender: UITextField) {
        
        loadTipResult()
        
    }
    
    //Main func that does the calculation
    func loadTipResult() {
        
        //Load the value from NSUserdefault
        doubleValue = defaults.double(forKey: "TipPercent")
        
        //you can use if billAmount = Double(billField.text) { //the rest of the code here } too but guard statement is powerful in here to reduce loads of code and its safe so you don't have to unwrap the optionals on billAmount
        guard let billAmount = Double(billField.text!) else { return }//NSString(string: billField.text!).doubleValue
        
        //Just for safety check
        if doubleValue != nil {
            
            
            
            let tip = billAmount * doubleValue! //doubleValue is forcefully unwrap 1since you are sure that it exist with that if statement
            let total = billAmount + tip
            
            if(numberOfPeople.text != "") {
                let number = Double(numberOfPeople.text!)!
                
                
                multiplePerson.text = String(format: "$%.2f", total/number)
            }
            tipLabel.text = String(format: "$%.2f", tip)
            totalLabel.text = String(format: "$%.2f", total)
            onePerson.text = String(format: "$%.2f", total)
            twoPerson.text = String(format: "$%.2f", total/2)
            threePerson.text = String(format: "$%.2f", total/3)
            fourPerson.text = String(format: "$%.2f", total/4)
            fivePerson.text = String(format: "$%.2f", total/5)
            
        } else {
            
            tipLabel.text = String(format: "$%.2f", 0.0)
            totalLabel.text = String(format: "$%.2f", 0.0)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.text = ""
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        doubleValue = defaults.double(forKey: "TipPercent")
        
        //Making sure that the setting here takes in whatever was already in the NSUserDefaults
        if doubleValue == 0.18 {
            tipControl.selectedSegmentIndex = 0
        } else if doubleValue == 0.20 {
            tipControl.selectedSegmentIndex = 1
        } else if doubleValue == 0.22 {
            tipControl.selectedSegmentIndex = 2
        }
        
        loadTipResult()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func onTap(_ sender: AnyObject) {
        
        view.endEditing(true)
        
        
    }
    
}

