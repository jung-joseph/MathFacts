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

    
    func initialize(userSettings: UserSettings){
       number1 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        number2 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        number3 = number1 + number2
    }

    func addition(userSettings: UserSettings){
        number1 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        number2 = Int.random(in: Int(userSettings.addMinNumber)...Int(userSettings.addMaxNumber + 1))
        number3 = number1 + number2
    }
    
}
