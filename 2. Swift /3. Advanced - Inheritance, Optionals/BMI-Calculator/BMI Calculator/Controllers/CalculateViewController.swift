//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var bmiCalculated = ""
    var bmiBrain = CalculateBMI()
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        heightLabel.text = String(format: "%.2f", sender.value) + " m"
    }
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        weightLabel.text = "\(Int(sender.value)) Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        bmiBrain.calculateBMI(height, weight)
        
        
        // Show second view controller & move to other screen
        self.performSegue(withIdentifier: "move2Result", sender: self)
    }
    
    // This methods prepare the transition (segue) attatching to it the data in order to pass it to the other ViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "move2Result" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmi = bmiBrain.getBMI()
            destinationVC.color = bmiBrain.getColor()
            destinationVC.advice = bmiBrain.getAdvice()
        }
    }
}

