//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Jesus Lopez de Nava on 6/27/15.
//  Copyright (c) 2015 LodenaApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    @IBOutlet var userGuess: UITextField!
    
    @IBOutlet var resultImage: UIImageView!
    
    @IBOutlet var resetButton: UIButton!
    
    @IBOutlet var revealButton: UIButton!
    
    @IBAction func revealAnswer(sender: AnyObject) {
        
        let fingersGuess = Int(userGuess.text!)
        
        if fingersGuess != nil && fingersGuess < 6 {
            
            let compNumber = Int(arc4random_uniform(6))
            
            let imageName = UIImage(named: "\(compNumber) Fingers.png")
            
            resultImage.image = imageName
            
            self.view.endEditing(true)
            
            revealButton.enabled = false
            
            resetButton.enabled = true
            
            userGuess.enabled = false
            
            if compNumber == fingersGuess! {
                
                resultLabel.text = "You Got it!"
                
            } else {
                
                resultLabel.text = "Sorry!"
                
            }
            
        } else {
            
            resultLabel.text = "Please from 0 to 5"
            
        }
    
    }
    
    @IBAction func resetGame(sender: AnyObject) {
        
        let imageName = UIImage(named: "Question Mark.png")
        
        resultImage.image = imageName
        
        userGuess.text = nil
        
        resultLabel.text = nil
        
        revealButton.enabled = true
        
        resetButton.enabled = false
        
        userGuess.enabled = true
        
        userGuess.becomeFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resetButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        self.view.endEditing(true)
        
    }

}

