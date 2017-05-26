//
//  Audio.swift
//  FancyWancyCalculator
//
//  Created by Jeff Ripke on 5/26/17.
//  Copyright © 2017 Jeff Ripke. All rights reserved.
//

import Foundation
import AVFoundation

class Audio {
    
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
    
    let audio = [
        "zero": "0",
        "one": "1",
        "two": "2",
        "three": "3",
        "four": "4",
        "five": "5",
        "six": "6",
        "seven": "7",
        "eight": "8",
        "nine": "9",
        "plus": "plus",
        "minus": "minus",
        "equals": "equals",
        "clear": "clear"
    ]
}
