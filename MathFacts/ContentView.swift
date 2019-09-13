//
//  ContentView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mathModel = MathModel(num1Min: 0, num1Max: 10, num2Min: 0, num2Max: 10)
    @State private var rightWrong: String = ""
    @State private var answerDisplay: String = "??"
    @State private var score: Int = 0
    @State private var newProblem: Bool = true
    @State private var numProblems: Int = 1
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
    }
    
    var body: some View {
        
        
        NavigationView{
            ZStack{
                //Define the screen Color
                Color.blue
                    // Extend the screen to all edges
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    
                    HStack{
                        Spacer()
                        Text("Score: \(score) / \(numProblems)")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(Color.white)
                    }
                    
                    HStack{
                        Text("\(mathModel.number1)").font(.largeTitle)
                        Text(" + ").font(.largeTitle)
                        Text("\(mathModel.number2)").font(.largeTitle)
                        Text(" = ").font(.largeTitle)
                        //                    Text("\(mathModel.number3)").font(.largeTitle)
                        Text("\(answerDisplay)").font(.largeTitle)
                    }.background(Color.white).padding().cornerRadius(10).shadow(radius: 10)
                    
                    
                    if rightWrong == "Right!" {
                        Text("\(rightWrong)").foregroundColor(Color.green).font(.largeTitle)
                    } else {
                        Text("\(rightWrong)").foregroundColor(Color.red).font(.largeTitle)
                        
                    }
                    
                    TextField("Answer", text: $mathModel.answerText)
                        .textFieldStyle(RoundedBorderTextFieldStyle()).padding().font(.custom("Arial", size: 40))
                        .keyboardType(.numberPad)
                    
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
                        .font(.largeTitle)
                    
                    Text("Double Tap For A New Problem")
                        .font(.title)
                        .foregroundColor(Color.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    
                    
                }// VStack
            } // ZStack
                .navigationBarTitle("MathFacts!")
            
        }// NavigationView
            .onTapGesture(count: 2){
                print("Tapped!")
                self.mathModel.addition()
                self.answerDisplay = "??"
                self.mathModel.answerText = ""
                self.newProblem = true
                self.numProblems += 1
                self.rightWrong = ""
        }
        
        
    }
}// ContentView


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
