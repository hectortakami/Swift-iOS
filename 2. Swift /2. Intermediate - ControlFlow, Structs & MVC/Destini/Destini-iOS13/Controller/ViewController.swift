//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var storyBrain = StoryBrain()
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let nextStory = self.storyBrain.getNextStory(choice: sender.currentTitle!)
        updateUI(story: nextStory)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstStory = self.storyBrain.getNextStory(choice: nil)
        updateUI(story: firstStory)
    }
    
    func updateUI(story: Story){
        storyLabel.text = story.title
        choice1Button.setTitle(story.choice1, for: .normal)
        choice2Button.setTitle(story.choice2, for: .normal)
    }
    
    
}

