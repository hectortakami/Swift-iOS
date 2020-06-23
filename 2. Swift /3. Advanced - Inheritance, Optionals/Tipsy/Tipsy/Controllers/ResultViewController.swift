//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Hector Takami on 03/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var totalTip: Float?
    var numberOfPersons: Int?
    var tipPercentage: Int?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalTip ?? 0.0)
        settingsLabel.text = "Split between \(numberOfPersons ?? 2) people, with \(tipPercentage ?? 10)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
