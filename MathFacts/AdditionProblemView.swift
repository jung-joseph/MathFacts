//
//  AdditionProblem.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct AdditionProblemView: View {
    @ObservedObject var mathModel: MathModel
    @Binding var answerDisplay: String
    var body: some View {
        HStack{
            Text("\(mathModel.number1)").font(.largeTitle).foregroundColor(Color.white)
            Text(" + ").font(.largeTitle).foregroundColor(Color.white)
            Text("\(mathModel.number2)").font(.largeTitle).foregroundColor(Color.white)
            Text(" = ").font(.largeTitle).foregroundColor(Color.white)
            //                    Text("\(mathModel.number3)").font(.largeTitle)
            Text("\(answerDisplay)").font(.largeTitle).foregroundColor(Color.red)
        }.background(Color.blue).padding().cornerRadius(10).shadow(radius: 10)
    }
}

struct AdditionProblemView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionProblemView(mathModel: MathModel(), answerDisplay: .constant("0"))
    }
}
