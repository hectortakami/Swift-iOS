//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var diceArr = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
//------------------------------------------------
    // Select UI item (Ctrl + Drag) to link it
    // Common Error when not properly linked to IBOutlet or IBAction
    // Thread 1: signal SIGABRT and "Not Key Value Coding Compliant"
//------------------------------------------------
    // IBOutlet links to UI element to manage view properties & attributes
    @IBOutlet weak var diceImageViewL: UIImageView!
    @IBOutlet weak var diceImageViewR: UIImageView!
//------------------------------------------------
    // IBAction is a linked function to a certain UI element such as buttons
    @IBOutlet weak var rollButton: UIButton!
    @IBAction func rollButtonPress(_ sender: UIButton) {
        generateRandom()
    }
//------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        rollButton.layer.cornerRadius = 25
        generateRandom()
    }
    
    func generateRandom(){
        // let randomL = Int.random(in: 0...5)
        // String Interpolation
        let x = 5
        print("Something \(x)")
        diceImageViewL.image = diceArr.randomElement()
        diceImageViewR.image = diceArr.randomElement()
    }


}

