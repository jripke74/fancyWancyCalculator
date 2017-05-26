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
    
    let audio = Audio()
    
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
        let buttonZeroSoundPath = Bundle.main.path(forResource: "0", ofType: "m4a")
        let buttonOneSoundPath = Bundle.main.path(forResource: "1", ofType: "m4a")
        let buttonTwoSoundPath = Bundle.main.path(forResource: "2", ofType: "m4a")
        let buttonThreeSoundPath = Bundle.main.path(forResource: "3", ofType: "m4a")
        let buttonFourSoundPath = Bundle.main.path(forResource: "4", ofType: "m4a")
        let buttonFiveSoundPath = Bundle.main.path(forResource: "5", ofType: "m4a")
        let buttonSixSoundPath = Bundle.main.path(forResource: "6", ofType: "m4a")
        let buttonSevenSoundPath = Bundle.main.path(forResource: "7", ofType: "m4a")
        let buttonEightSoundPath = Bundle.main.path(forResource: "8", ofType: "m4a")
        let buttonNineSoundPath = Bundle.main.path(forResource: "9", ofType: "m4a")
        
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
            try audio.buttonZeroAudioPlayer = AVAudioPlayer(contentsOf: buttonZeroSoundURL)
            try audio.buttonOneAudioPlayer = AVAudioPlayer(contentsOf: buttonOneSoundURL)
            try audio.buttonTwoAudioPlayer = AVAudioPlayer(contentsOf: buttonTwoSoundURL)
            try audio.buttonThreeAudioPlayer = AVAudioPlayer(contentsOf: buttonThreeSoundURL)
            try audio.buttonFourAudioPlayer = AVAudioPlayer(contentsOf: buttonFourSoundURL)
            try audio.buttonFiveAudioPlayer = AVAudioPlayer(contentsOf: buttonFiveSoundURL)
            try audio.buttonSixAudioPlayer = AVAudioPlayer(contentsOf: buttonSixSoundURL)
            try audio.buttonSevenAudioPlayer = AVAudioPlayer(contentsOf: buttonSevenSoundURL)
            try audio.buttonEightAudioPlayer = AVAudioPlayer(contentsOf: buttonEightSoundURL)
            try audio.buttonNineAudioPlayer = AVAudioPlayer(contentsOf: buttonNineSoundURL)
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
            if audio.buttonZeroAudioPlayer.isPlaying {
                audio.buttonZeroAudioPlayer.stop()
            } else {
                audio.buttonZeroAudioPlayer.play()
            }
        case 1:
            if audio.buttonOneAudioPlayer.isPlaying {
                audio.buttonOneAudioPlayer.stop()
            } else {
                audio.buttonOneAudioPlayer.play()
            }
        case 2:
            if audio.buttonTwoAudioPlayer.isPlaying {
                audio.buttonTwoAudioPlayer.stop()
            } else {
                audio.buttonTwoAudioPlayer.play()
            }
        case 3:
            if audio.buttonThreeAudioPlayer.isPlaying {
                audio.buttonThreeAudioPlayer.stop()
            } else {
                audio.buttonThreeAudioPlayer.play()
            }
        case 4:
            if audio.buttonFourAudioPlayer.isPlaying {
                audio.buttonFourAudioPlayer.stop()
            } else {
                audio.buttonFourAudioPlayer.play()
            }
        case 5:
            if audio.buttonFiveAudioPlayer.isPlaying {
                audio.buttonFiveAudioPlayer.stop()
            } else {
                audio.buttonFiveAudioPlayer.play()
            }
        case 6:
            if audio.buttonSixAudioPlayer.isPlaying {
                audio.buttonSixAudioPlayer.stop()
            } else {
                audio.buttonSixAudioPlayer.play()
            }
        case 7:
            if audio.buttonSevenAudioPlayer.isPlaying {
                audio.buttonSevenAudioPlayer.stop()
            } else {
                audio.buttonSevenAudioPlayer.play()
            }
        case 8:
            if audio.buttonEightAudioPlayer.isPlaying {
                audio.buttonEightAudioPlayer.stop()
            } else {
                audio.buttonEightAudioPlayer.play()
            }
        case 9:
            if audio.buttonNineAudioPlayer.isPlaying {
                audio.buttonNineAudioPlayer.stop()
            } else {
                audio.buttonNineAudioPlayer.play()
            }
        default:
            break
        }
    }
    
    @IBAction func additionOperatorPressed(sender: UIButton) {
        let buttonAddSoundPath = Bundle.main.path(forResource: "plus", ofType: "m4a")
        let buttonAddSoundURL = URL(fileURLWithPath: buttonAddSoundPath!)
        
        do {
            try audio.buttonAddAudioPlayer = AVAudioPlayer(contentsOf: buttonAddSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if audio.buttonAddAudioPlayer.isPlaying {
            audio.buttonAddAudioPlayer.stop()
        } else {
            audio.buttonAddAudioPlayer.play()
        }
        processOperation(operation: .Add)
    }
    
    @IBAction func subtractionOperatorPressed(sender: UIButton) {
        let buttonSubtractSoundPath = Bundle.main.path(forResource: "minus", ofType: "m4a")
        let buttonSubtractSoundURL = URL(fileURLWithPath: buttonSubtractSoundPath!)
        
        do {
            try audio.buttonSubtractAudioPlayer = AVAudioPlayer(contentsOf: buttonSubtractSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if audio.buttonSubtractAudioPlayer.isPlaying {
            audio.buttonSubtractAudioPlayer.stop()
        } else {
            audio.buttonSubtractAudioPlayer.play()
        }
        processOperation(operation: .Subtract)
    }
    
    @IBAction func multiplicationOperatorPressed(sender: UIButton) {
        let buttonMultiplySoundPath = Bundle.main.path(forResource: "times", ofType: "m4a")
        let buttonMultiplySoundURL = URL(fileURLWithPath: buttonMultiplySoundPath!)
        
        do {
            try audio.buttonMultiplyAudioPlayer = AVAudioPlayer(contentsOf: buttonMultiplySoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if audio.buttonMultiplyAudioPlayer.isPlaying {
            audio.buttonMultiplyAudioPlayer.stop()
        } else {
            audio.buttonMultiplyAudioPlayer.play()
        }
        processOperation(operation: .Multiply)
    }
    
    @IBAction func divisionOperatorPressed(sender: UIButton) {
        let buttonDivideSoundPath = Bundle.main.path(forResource: "dividedBy", ofType: "m4a")
        let buttonDivideSoundURL = URL(fileURLWithPath: buttonDivideSoundPath!)
        
        do {
            try audio.buttonDivideAudioPlayer = AVAudioPlayer(contentsOf: buttonDivideSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if audio.buttonDivideAudioPlayer.isPlaying {
            audio.buttonDivideAudioPlayer.stop()
        } else {
            audio.buttonDivideAudioPlayer.play()
        }
        processOperation(operation: .Divide)
    }
    
    @IBAction func egualButtonPressed(sender: UIButton) {
        let buttonEqualSoundPath = Bundle.main.path(forResource: "equals", ofType: "m4a")
        let buttonEqualSoundURL = URL(fileURLWithPath: buttonEqualSoundPath!)
        
        do {
            try audio.buttonEqualAudioPlayer = AVAudioPlayer(contentsOf: buttonEqualSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if audio.buttonEqualAudioPlayer.isPlaying {
            audio.buttonEqualAudioPlayer.stop()
        } else {
            audio.buttonEqualAudioPlayer.play()
        }
        processOperation(operation: currentOperation)
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        let buttonClearSoundPath = Bundle.main.path(forResource: "clear", ofType: "m4a")
        let buttonClearSoundURL = URL(fileURLWithPath: buttonClearSoundPath!)
        
        do {
            try audio.buttonClearAudioPlayer = AVAudioPlayer(contentsOf: buttonClearSoundURL)
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        if audio.buttonClearAudioPlayer.isPlaying {
            audio.buttonClearAudioPlayer.stop()
        } else {
            audio.buttonClearAudioPlayer.play()
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
