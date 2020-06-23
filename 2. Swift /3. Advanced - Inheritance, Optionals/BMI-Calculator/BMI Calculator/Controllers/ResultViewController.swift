//
//  BMIViewController.swift
//  BMI Calculator
//
//  Created by Hector Takami on 02/06/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var bmi : String? = nil
    var advice : String? = nil
    var color : UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmi ?? ""
        adviceLabel.text = advice ?? ""
        view.backgroundColor = color ?? UIColor.white
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        // Remove ViewController and return to the previous screen
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}
