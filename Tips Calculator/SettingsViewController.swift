//
//  SettingsViewController.swift
//  Tips Calculator
//
//  Created by Lum Situ on 12/12/16.
//  Copyright © 2016 Lum Situ. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var defaultTipControl: UISegmentedControl!
    let tipPercentage = [0.15, 0.18,0.2]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let segmentWasChosed = UserDefaults.standard.integer(forKey: "defaultSegmentChosed")
        defaultTipControl.selectedSegmentIndex = segmentWasChosed
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("SettingsViewController will appear")
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func setDefaultTip(_ sender: Any) {
        
        let tipValue = tipPercentage[defaultTipControl.selectedSegmentIndex]
        
        let defaults = UserDefaults.standard
        defaults.set(tipValue, forKey: "default_tip_percentage")
        defaults.synchronize()        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
