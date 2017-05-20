//
//  ViewController.swift
//  FancyWancyCalculator
//
//  Created by Jeff Ripke on 5/19/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var outputLabel: UITextField!
    
    var runningNumber = ""
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
        outputLabel.text = "0"
    }

    @IBAction func numberPressed(sender: UIButton) {
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    }
    
    @IBAction func additionOperatorPressed(sender: UIButton) {
        
    }
    
    @IBAction func subtractionOperatorPressed(sender: UIButton) {
        
    }
    
    @IBAction func multiplicationOperatorPressed(sender: UIButton) {
        
    }
    
    @IBAction func divisionOperatorPressed(sender: UIButton) {
        
    }
    
    @IBAction func egualButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func clearButtonPressed(sender: UIButton) {
        
    }
    
    func processOperation(operation: Operation) {
        if currentOperation != Operation.Empty {
            rightOperandString = runningNumber
            if runningNumber != "" {
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
