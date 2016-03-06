//
//  ViewController.swift
//  tips2
//
//  Created by The Vinh Duong on 2/20/16.
//  Copyright © 2016 The Vinh Duong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let userDefaults  = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        // Show the keyboard when app starts
        billField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
     
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let tipPercentage = userDefaults.doubleForKey("tip")
        let tipIndex = userDefaults.integerForKey("ind")
        
        let billAmount = Double((billField.text! as NSString).doubleValue)
        
        tipControl.selectedSegmentIndex = tipIndex
        
        let tip = billAmount * tipPercentage
        
        let total = billAmount + tip
        
        tipLabel.text = String(format:"$%.2f", tip)
        
        totalLabel.text = String(format:"$%.2f", total)
        
        
        
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        let billAmount = Double((billField.text! as NSString).doubleValue)
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let index = tipControl.selectedSegmentIndex
    
        userDefaults.setObject(billAmount, forKey: "bill")
        userDefaults.setObject(tipPercentage, forKey: "tip")
        userDefaults.setInteger(index, forKey: "ind")
        userDefaults.synchronize()
    }
    
    
    
    
}

