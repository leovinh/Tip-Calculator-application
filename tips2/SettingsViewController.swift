//
//  SettingsViewController.swift
//  tips2
//
//  Created by The Vinh Duong on 2/23/16.
//  Copyright © 2016 The Vinh Duong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let userDefaults  = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Do any additional setup after loading the view.
        let tipIndex = (userDefaults.integerForKey("ind"))
        tipControl.selectedSegmentIndex = tipIndex
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actPercentage(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        let index = tipControl.selectedSegmentIndex
        
        
        userDefaults.setObject(tipPercentage, forKey: "tip")
        userDefaults.setInteger(index, forKey: "ind")
    }
    
    
    
}
