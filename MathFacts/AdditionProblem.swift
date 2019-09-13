//
//  AdditionProblem.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct AdditionProblem: View {
    @ObservedObject var mathModel: MathModel
    @Binding var answerDisplay: String
    var body: some View {
        HStack{
            Text("\(mathModel.number1)").font(.largeTitle)
            Text(" + ").font(.largeTitle)
            Text("\(mathModel.number2)").font(.largeTitle)
            Text(" = ").font(.largeTitle)
            //                    Text("\(mathModel.number3)").font(.largeTitle)
            Text("\(answerDisplay)").font(.largeTitle)
        }.background(Color.white).padding().cornerRadius(10).shadow(radius: 10)
    }
}

struct AdditionProblem_Previews: PreviewProvider {
    static var previews: some View {
        AdditionProblem(mathModel: MathModel(num1Min: 0, num1Max: 0, num2Min: 0, num2Max: 0), answerDisplay: .constant("0"))
    }
}
