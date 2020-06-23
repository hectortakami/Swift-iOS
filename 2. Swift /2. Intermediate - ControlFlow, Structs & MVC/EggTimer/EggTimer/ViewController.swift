//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cookTimes = ["Soft":5.0, "Medium":7.0, "Hard":12.0]
    var timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        startCountDown(cookTime: Float(cookTimes[hardness]!))
    }
    
    func startCountDown(cookTime: Float){
        progressBar.progress = 0
        self.timer.invalidate()
        var secondsRemaining = cookTime * 60.0
        let cookFactor = Float(1/secondsRemaining)
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            if secondsRemaining > 0 {
                var secondsLeft: String? = nil
                if Int(secondsRemaining) % 60 == 0 {
                   secondsLeft = "00"
                }else if Int(secondsRemaining) % 60 <= 9
                {
                    secondsLeft = "0" + String(Int(secondsRemaining) % 60)
                }else {
                   secondsLeft = String(Int(secondsRemaining) % 60)
                }
                self.titleLabel.text = "Time left \n\(Int(secondsRemaining/60)):" + secondsLeft!
                self.progressBar.progress += cookFactor
                secondsRemaining -= 1
            }else {
                print("Done!")
                self.titleLabel.text = "Egg Ready!"
                self.timer.invalidate()
            }
        }
    }
    

}
