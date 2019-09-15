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
    var num1Min: Int = 0
    var num1Max: Int = 0
    var num2Min: Int = 0
    var num2Max: Int = 0
    
//    init(num1Min:Int, num1Max: Int, num2Min: Int, num2Max: Int){
//        self.num1Min = num1Min
//        self.num1Max = num1Max
//        self.num2Min = num2Min
//        self.num2Max = num2Max
//
//    }

    func addition(){
        number1 = Int.random(in: self.num1Min...self.num1Max + 1)
        number2 = Int.random(in: self.num2Min...self.num2Max + 1)
        number3 = number1 + number2
    }
    
}
