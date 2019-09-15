//
//  Problem.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct ProblemView: View {
    @ObservedObject var mathModel: MathModel
    @Binding var answerDisplay: String
    var body: some View {
        HStack{
            Text("\(mathModel.number1)").font(.largeTitle).foregroundColor(Color.white)
            if mathModel.problemType == "Addition" {
                Text(" + ").font(.largeTitle).foregroundColor(Color.white)
            } else if mathModel.problemType == "Subtraction" {
                Text(" - ").font(.largeTitle).foregroundColor(Color.white)
            } else if mathModel.problemType == "Multiplication" {
                Text(" X ").font(.largeTitle).foregroundColor(Color.white)
            } else if mathModel.problemType == "Division" {
                Text(" / ").font(.largeTitle).foregroundColor(Color.white)
            }
            Text("\(mathModel.number2)").font(.largeTitle).foregroundColor(Color.white)
            Text(" = ").font(.largeTitle).foregroundColor(Color.white)
            //                    Text("\(mathModel.number3)").font(.largeTitle)
            Text("\(answerDisplay)").font(.largeTitle).foregroundColor(Color.red)
        }.background(Color.blue).padding().cornerRadius(10).shadow(radius: 10)
    }
}

struct ProblemView_Previews: PreviewProvider {
    static var previews: some View {
        ProblemView(mathModel: MathModel(), answerDisplay: .constant("0"))
    }
}
