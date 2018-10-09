//
//  ViewController.swift
//  Dicee
//
//  Created by Jakub klučovský on 10/8/18.
//  Copyright © 2018 KPS Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomDiceIndex1: Int = 0
    var randomDiceIndex2: Int = 0
    var scoreNumber: Int = 0
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var Score1Label: UILabel!
    @IBOutlet weak var scoreCounter: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {
        self.Score1Label.text = ""
        let randomDiceRoll = updateDiceImages()
        
        if randomDiceRoll == (5,5) {
         self.Score1Label.text = "+1 Score"
            scoreNumber = scoreNumber + 1
            self.scoreCounter.text = "Score: \(scoreNumber)"
        }
    }
    
    func updateDiceImages() -> (Int, Int) {
        randomDiceIndex1 = Int(arc4random_uniform(6))
        randomDiceIndex2 = Int(arc4random_uniform(6))
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
        return (randomDiceIndex1, randomDiceIndex2)
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        self.Score1Label.text = ""
        let randomDiceRoll = updateDiceImages()
        
        if randomDiceRoll == (5,5) {
            self.Score1Label.text = "+1 Score"
            scoreNumber = scoreNumber + 1
            self.scoreCounter.text = "Score: \(scoreNumber)"
        }
    }
}

