//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipPercentage: Int?
    var numberPersons: Float?
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        let buttonTitleMinusPercentSign =  String(sender.currentTitle!.dropLast())
        tipPercentage = Int(buttonTitleMinusPercentSign)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
        numberPersons = Float(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text?.count ?? -1 > 0 {
            print(billTextField.text!)
        }
        
        performSegue(withIdentifier: "move2Result", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.totalTip = calculateTip()
        destinationVC.numberOfPersons = Int(splitNumberLabel.text!)
        destinationVC.tipPercentage = tipPercentage
    }
    
    func calculateTip()->Float{
        var billTotal: Float = 0.0
        if billTextField.text?.count ?? -1 > 0 {
            billTotal = Float(billTextField.text!)!
        }
        let tip = Float(tipPercentage ?? 10) / 100.0
        let total = ((billTotal * tip) + billTotal) / Float(numberPersons ?? 2.0)
        return total
    }
    
    
    

}

