//
//  ViewController.swift
//  Tips Calculator
//
//  Created by Lum Situ on 12/12/16.
//  Copyright © 2016 Lum Situ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var TipControl: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentage = [0.15, 0.18, 0.2]
        
        let bill = Double(BillField.text!) ?? 0
        let tip = bill * tipPercentage[TipControl.selectedSegmentIndex]
        let total = tip + bill
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = UserDefaults.standard
        let tipValue = defaults.double(forKey: "default_tip_percentage")
        let bill = Double(BillField.text!) ?? 0
       
        let tip = bill * tipValue
        let total = bill + tip
        
        TipLabel.text = String(format: "$%.2f", tip)
        TotalLabel.text = String(format: "$%.2f", total)
        
        
        switch tipValue {
        case 0.15:
            TipControl.selectedSegmentIndex = 0
            
        case 0.18:
            TipControl.selectedSegmentIndex = 1
            
        default:
            TipControl.selectedSegmentIndex = 2
            
        }
        
        
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        
        // Set an Integer value for some key.
        UserDefaults.standard.set(TipControl.selectedSegmentIndex, forKey: "defaultSegmentChosed")
        
        // Force UserDefaults to save.
        UserDefaults.standard.synchronize()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}

