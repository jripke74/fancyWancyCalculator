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
    
    var buttonZeroAudioPlayer = AVAudioPlayer()
    var buttonOneAudioPlayer = AVAudioPlayer()
    var buttonTwoAudioPlayer = AVAudioPlayer()
    var buttonThreeAudioPlayer = AVAudioPlayer()
    var buttonFourAudioPlayer = AVAudioPlayer()
    var buttonFiveAudioPlayer = AVAudioPlayer()
    var buttonSixAudioPlayer = AVAudioPlayer()
    var buttonSevenAudioPlayer = AVAudioPlayer()
    var buttonEightAudioPlayer = AVAudioPlayer()
    var buttonNineAudioPlayer = AVAudioPlayer()
    var buttonAddAudioPlayer = AVAudioPlayer()
    var buttonSubtractAudioPlayer = AVAudioPlayer()
    var buttonMultiplyAudioPlayer = AVAudioPlayer()
    var buttonDivideAudioPlayer = AVAudioPlayer()
    var buttonClearAudioPlayer = AVAudioPlayer()
    var buttonEqualAudioPlayer = AVAudioPlayer()
    
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
        let buttonZeroSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonOneSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonTwoSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonThreeSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonFourSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonFiveSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonSixSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonSevenSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonEightSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonNineSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        
        let buttonZeroSoundURL = URL(fileURLWithPath: buttonZeroSoundPath!)
        let buttonOneSoundURL = URL(fileURLWithPath: buttonOneSoundPath!)
        let buttonTwoSoundURL = URL(fileURLWithPath: buttonTwoSoundPath!)
        let buttonThreeSoundURL = URL(fileURLWithPath: buttonThreeSoundPath!)
        let buttonFourSoundURL = URL(fileURLWithPath: buttonFourSoundPath!)
        let buttonFiveSoundURL = URL(fileURLWithPath: buttonFiveSoundPath!)
        let buttonSixSoundURL = URL(fileURLWithPath: buttonSixSoundPath!)
        let buttonSevenSoundURL = URL(fileURLWithPath: buttonSevenSoundPath!)
        let buttonEightSoundURL = URL(fileURLWithPath: buttonEightSoundPath!)
        let buttonNineSoundURL = URL(fileURLWithPath: buttonNineSoundPath!)
        
        do {
            try buttonZeroAudioPlayer = AVAudioPlayer(contentsOf: buttonZeroSoundURL)
            try buttonOneAudioPlayer = AVAudioPlayer(contentsOf: buttonOneSoundURL)
            try buttonTwoAudioPlayer = AVAudioPlayer(contentsOf: buttonTwoSoundURL)
            try buttonThreeAudioPlayer = AVAudioPlayer(contentsOf: buttonThreeSoundURL)
            try buttonFourAudioPlayer = AVAudioPlayer(contentsOf: buttonFourSoundURL)
            try buttonFiveAudioPlayer = AVAudioPlayer(contentsOf: buttonFiveSoundURL)
            try buttonSixAudioPlayer = AVAudioPlayer(contentsOf: buttonSixSoundURL)
            try buttonSevenAudioPlayer = AVAudioPlayer(contentsOf: buttonSevenSoundURL)
            try buttonEightAudioPlayer = AVAudioPlayer(contentsOf: buttonEightSoundURL)
            try buttonNineAudioPlayer = AVAudioPlayer(contentsOf: buttonNineSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        outputLabel.text = "0"
    }

    @IBAction func numberPressed(sender: UIButton) {
        numberPressed = "\(sender.tag)"
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
        switch sender.tag {
        case 0:
            if buttonZeroAudioPlayer.isPlaying {
                buttonZeroAudioPlayer.stop()
            } else {
                buttonZeroAudioPlayer.play()
            }
        case 1:
            if buttonOneAudioPlayer.isPlaying {
                buttonOneAudioPlayer.stop()
            } else {
                buttonOneAudioPlayer.play()
            }
        case 2:
            if buttonTwoAudioPlayer.isPlaying {
                buttonTwoAudioPlayer.stop()
            } else {
                buttonTwoAudioPlayer.play()
            }
        case 3:
            if buttonThreeAudioPlayer.isPlaying {
                buttonThreeAudioPlayer.stop()
            } else {
                buttonThreeAudioPlayer.play()
            }
        case 4:
            if buttonFourAudioPlayer.isPlaying {
                buttonFourAudioPlayer.stop()
            } else {
                buttonFourAudioPlayer.play()
            }
        case 5:
            if buttonFiveAudioPlayer.isPlaying {
                buttonFiveAudioPlayer.stop()
            } else {
                buttonFiveAudioPlayer.play()
            }
        case 6:
            if buttonSixAudioPlayer.isPlaying {
                buttonSixAudioPlayer.stop()
            } else {
                buttonSixAudioPlayer.play()
            }
        case 7:
            if buttonSevenAudioPlayer.isPlaying {
                buttonSevenAudioPlayer.stop()
            } else {
                buttonSevenAudioPlayer.play()
            }
        case 8:
            if buttonEightAudioPlayer.isPlaying {
                buttonEightAudioPlayer.stop()
            } else {
                buttonEightAudioPlayer.play()
            }
        case 9:
            if buttonNineAudioPlayer.isPlaying {
                buttonNineAudioPlayer.stop()
            } else {
                buttonNineAudioPlayer.play()
            }
        default:
            break
        }
    }
    
    @IBAction func additionOperatorPressed(sender: UIButton) {
        let buttonAddSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonAddSoundURL = URL(fileURLWithPath: buttonAddSoundPath!)
        
        do {
            try buttonAddAudioPlayer = AVAudioPlayer(contentsOf: buttonAddSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if buttonAddAudioPlayer.isPlaying {
            buttonAddAudioPlayer.stop()
        } else {
            buttonAddAudioPlayer.play()
        }
        processOperation(operation: .Add)
    }
    
    @IBAction func subtractionOperatorPressed(sender: UIButton) {
        let buttonSubtractSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonSubtractSoundURL = URL(fileURLWithPath: buttonSubtractSoundPath!)
        
        do {
            try buttonSubtractAudioPlayer = AVAudioPlayer(contentsOf: buttonSubtractSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if buttonSubtractAudioPlayer.isPlaying {
            buttonSubtractAudioPlayer.stop()
        } else {
            buttonSubtractAudioPlayer.play()
        }
        processOperation(operation: .Subtract)
    }
    
    @IBAction func multiplicationOperatorPressed(sender: UIButton) {
        let buttonMultiplySoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonMultiplySoundURL = URL(fileURLWithPath: buttonMultiplySoundPath!)
        
        do {
            try buttonMultiplyAudioPlayer = AVAudioPlayer(contentsOf: buttonMultiplySoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if buttonMultiplyAudioPlayer.isPlaying {
            buttonMultiplyAudioPlayer.stop()
        } else {
            buttonMultiplyAudioPlayer.play()
        }
        processOperation(operation: .Multiply)
    }
    
    @IBAction func divisionOperatorPressed(sender: UIButton) {
        let buttonDivideSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonDivideSoundURL = URL(fileURLWithPath: buttonDivideSoundPath!)
        
        do {
            try buttonDivideAudioPlayer = AVAudioPlayer(contentsOf: buttonDivideSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if buttonDivideAudioPlayer.isPlaying {
            buttonDivideAudioPlayer.stop()
        } else {
            buttonDivideAudioPlayer.play()
        }
        processOperation(operation: .Divide)
    }
    
    @IBAction func egualButtonPressed(sender: UIButton) {
        let buttonEqualSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonEqualSoundURL = URL(fileURLWithPath: buttonEqualSoundPath!)
        
        do {
            try buttonEqualAudioPlayer = AVAudioPlayer(contentsOf: buttonEqualSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if buttonEqualAudioPlayer.isPlaying {
            buttonEqualAudioPlayer.stop()
        } else {
            buttonEqualAudioPlayer.play()
        }
        processOperation(operation: currentOperation)
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        let buttonClearSoundPath = Bundle.main.path(forResource: "One", ofType: "m4a")
        let buttonClearSoundURL = URL(fileURLWithPath: buttonClearSoundPath!)
        
        do {
            try buttonClearAudioPlayer = AVAudioPlayer(contentsOf: buttonClearSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if buttonClearAudioPlayer.isPlaying {
            buttonClearAudioPlayer.stop()
        } else {
            buttonClearAudioPlayer.play()
        }
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
