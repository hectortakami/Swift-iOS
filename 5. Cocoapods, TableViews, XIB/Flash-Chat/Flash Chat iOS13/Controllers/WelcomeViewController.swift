//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "⚡️FlashChat" // CLTypingLabel Library
        
        // Manual implementation without using CLTypingLabel
        // self.titleLabel.text = ""
        // let text = "⚡️FlashChat"
        // var charIdx = 0
        // for letter in text {
        // Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIdx), repeats: false) { (timer) in
        // self.titleLabel.text?.append(letter)
        // }
        // charIdx += 1
        // }
        
    }
    
}
