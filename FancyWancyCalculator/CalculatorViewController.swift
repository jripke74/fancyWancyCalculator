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

}
