//
//  AnswerButton.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/13/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct AnswerButton: View {
    @ObservedObject var mathModel: MathModel
    @Binding var answerDisplay: String
    @Binding var rightWrong: String
    @Binding var newProblem: Bool
    @Binding var score: Int
    var body: some View {
        Button (action: {
            let answerTemp = Int(self.mathModel.answerText)
            if answerTemp == self.mathModel.number3 {
                print("Right")
                self.rightWrong = "Right!"
                self.answerDisplay = String(self.mathModel.number3)
                if self.newProblem {
                    self.score += 1
                }
                
            } else {
                print("Sorry")
                self.rightWrong = "Sorry!"
                self.answerDisplay = String(self.mathModel.number3)
                
            }
            self.newProblem = false
        }){Text("Enter Answer")}
            .background(Color.red)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            .shadow(radius: 10)
            .font(.largeTitle)    }
}

struct AnswerButton_Previews: PreviewProvider {
    static var previews: some View {
        AnswerButton(mathModel: MathModel(num1Min: 0, num1Max: 0, num2Min: 0, num2Max: 0), answerDisplay: .constant("0"), rightWrong: .constant("0"), newProblem: .constant(true), score: .constant(0))
    }
}
