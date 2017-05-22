//
//  ViewController.swift
//  FancyWancyCalculator
//
//  Created by Jeff Ripke on 5/19/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit
import AVFoundation

class CalculatorViewController: UIViewController {

    @IBOutlet weak var outputLabel: UITextField!
    
    var buttonOneAudioPlayer = AVAudioPlayer()
    var buttonTwoAudioPlayer = AVAudioPlayer()
    var buttonThreeAudioPlayer = AVAudioPlayer()
    var buttonFourAudioPlayer = AVAudioPlayer()
    
    var runningNumber = ""
    var numberPressed = ""
    var currentOperation = Operation.Empty
    var leftOperandString = ""
    var rightOperandString = ""
    var result = ""

    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let buttonOneSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonTwoSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonThreeSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonFourSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonOneSoundURL = URL(fileURLWithPath: buttonOneSoundPath!)
        let buttonTwoSoundURL = URL(fileURLWithPath: buttonTwoSoundPath!)
        let buttonThreeSoundURL = URL(fileURLWithPath: buttonThreeSoundPath!)
        let buttonFourSoundURL = URL(fileURLWithPath: buttonFourSoundPath!)
        do {
            try buttonOneAudioPlayer = AVAudioPlayer(contentsOf: buttonOneSoundURL)
            try buttonTwoAudioPlayer = AVAudioPlayer(contentsOf: buttonTwoSoundURL)
            try buttonThreeAudioPlayer = AVAudioPlayer(contentsOf: buttonThreeSoundURL)
            try buttonFourAudioPlayer = AVAudioPlayer(contentsOf: buttonFourSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        outputLabel.text = "0"
    }

    @IBAction func numberPressed(sender: UIButton) {
        numberPressed = "\(sender.tag)"
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        if sender.tag == 1 {
            if buttonOneAudioPlayer.isPlaying {
                buttonOneAudioPlayer.stop()
            } else {
                buttonOneAudioPlayer.play()
            }
        } else if sender.tag == 2 {
            if buttonTwoAudioPlayer.isPlaying {
                buttonTwoAudioPlayer.stop()
            } else {
                buttonTwoAudioPlayer.play()
            }
        } else if sender.tag == 3 {
            if buttonThreeAudioPlayer.isPlaying {
                buttonThreeAudioPlayer.stop()
            } else {
                buttonThreeAudioPlayer.play()
            }
        } else if sender.tag == 4 {
            if buttonTwoAudioPlayer.isPlaying {
                buttonTwoAudioPlayer.stop()
            } else {
                buttonTwoAudioPlayer.play()
            }
        }
    }
    
    @IBAction func additionOperatorPressed(sender: UIButton) {
        processOperation(operation: .Add)
    }
    
    @IBAction func subtractionOperatorPressed(sender: UIButton) {
        processOperation(operation: .Subtract)
    }
    
    @IBAction func multiplicationOperatorPressed(sender: UIButton) {
        processOperation(operation: .Multiply)
    }
    
    @IBAction func divisionOperatorPressed(sender: UIButton) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func egualButtonPressed(sender: UIButton) {
        processOperation(operation: currentOperation)
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        runningNumber = ""
        currentOperation = Operation.Empty
        leftOperandString = ""
        rightOperandString = ""
        result = ""
        outputLabel.text = "0"
    }
    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightOperandString = runningNumber
                runningNumber = ""
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftOperandString)! * Double(rightOperandString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftOperandString)! / Double(rightOperandString)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftOperandString)! - Double(rightOperandString)!)"
                } else if currentOperation == Operation.Add {
                    result = "\(Double(leftOperandString)! + Double(rightOperandString)!)"
                }
                leftOperandString = result
                outputLabel.text = result
            }
            currentOperation = operation
        } else {
            leftOperandString = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
}
