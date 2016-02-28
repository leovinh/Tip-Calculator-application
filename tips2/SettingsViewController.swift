//
//  SettingsViewController.swift
//  tips2
//
//  Created by The Vinh Duong on 2/23/16.
//  Copyright © 2016 The Vinh Duong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    var thamSoTruyen:NSUserDefaults!
   
    @IBOutlet weak var txtName: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        thamSoTruyen = NSUserDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        thamSoTruyen.setObject(txtName.text, forKey: "bien")
    }
    
}
