//
//  MathModel.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import Foundation

class MathModel: ObservableObject {
    @Published var number1: Int = 0
    @Published var number2: Int = 0
    @Published var number3: Int = 0
    @Published var answerText: String = ""
    @Published var problemType: String = "Addition"

    
    func initialize(userSettings: UserSettings){
        if problemType == "Addition"{
            number1 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
            number2 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
            number3 = number1 + number2
        } else if problemType == "Subtraction" {
            number1 = Int.random(in: Int(userSettings.subMinNumber)...Int(userSettings.subMaxNumber + 1))
            number2 = Int.random(in: Int(userSettings.subMinNumber)...Int(userSettings.subMaxNumber + 1))
            if userSettings.subMinNumber >= 0 && number2 > number1 {
                let temp = number1
                number1 = number2
                number2 = temp
            }
            number3 = number1 - number2
            
        } else if problemType == "Multiplication" {
            
        } else if problemType == "Division" {
            
        } else {
            problemType = "Addition"
            number1 = 0
            number2 = 0
            number3 = 0
        }
        
    }

    func addition(userSettings: UserSettings){
        number1 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        number2 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        number3 = number1 + number2
    }
    func subtraction(userSettings: UserSettings){
        number1 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        number2 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        if userSettings.subMinNumber >= 0 && number2 > number1 {
            let temp = number1
            number1 = number2
            number2 = temp
        }
        number3 = number1 - number2
    }
    
}
