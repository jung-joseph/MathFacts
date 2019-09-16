//
//  ContentView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userSettings = UserSettings()
    @ObservedObject var mathModel = MathModel()
//    mathModel = MathModel(userSettings: userSettings)

    @State private var rightWrong: String = ""
    @State private var answerDisplay: String = "??"
    @State private var score: Int = 0
    @State private var newProblem: Bool = true
    @State private var numProblems: Int = 1
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.red]
        mathModel.initialize(userSettings: userSettings)
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
                        Button (action: {
                            self.mathModel.problemType = "Addition"
                            self.mathModel.initialize(userSettings: self.userSettings)
                            self.answerDisplay = "??"
                            self.mathModel.answerText = ""

                        }){Text("Addition")}
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .font(.custom("Arial", size: 20))
                        Button (action: {
                            self.mathModel.problemType = "Subtraction"
                            self.mathModel.initialize(userSettings: self.userSettings)
                            self.answerDisplay = "??"
                            self.mathModel.answerText = ""


                        }){Text("Subtraction")}
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .font(.custom("Arial", size: 20))
                        Button (action: {
                            self.mathModel.problemType = "Multiplication"
                            self.mathModel.initialize(userSettings: self.userSettings)
                            self.answerDisplay = "??"
                            self.mathModel.answerText = ""


                        }){Text("Multiplication")}
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .font(.custom("Arial", size: 20))
                        Button (action: {
                            self.mathModel.problemType = "Division"
                            self.mathModel.initialize(userSettings: self.userSettings)
                            self.answerDisplay = "??"
                            self.mathModel.answerText = ""


                        }){Text("Division")}
                            .background(Color.red)
                            .foregroundColor(Color.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                            .font(.custom("Arial", size: 20))
                        
                    }

                    
                    
                    HStack{

                        RightWrongView(rightWrong: $rightWrong)
                        Spacer()
                        Text("Score: \(score) / \(numProblems)")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(Color.white)
                    }
                    
                    ProblemView(mathModel: mathModel, answerDisplay: $answerDisplay)

                    
                    TextField("Answer", text: $mathModel.answerText).textFieldStyle(RoundedBorderTextFieldStyle()).padding().font(.custom("Arial", size: 40)).foregroundColor(Color.red)
                        .keyboardType(.numbersAndPunctuation)
                    
                    AnswerButton(mathModel: mathModel, answerDisplay: $answerDisplay, rightWrong: $rightWrong, newProblem: $newProblem, score: $score)

                    
                    Text("Double Tap Anywhere For the Next Problem")
                        .font(.body)
                        .foregroundColor(Color.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    
                    
                }// VStack

            } // ZStack
                .navigationBarItems(trailing: SettingsButton(destination: UserSettingsView(userSettings: userSettings))).foregroundColor(Color.white)

                .navigationBarTitle("MathFacts!")
            
        }// NavigationView
            .onTapGesture(count: 2){
                print("Tapped!")
                if self.mathModel.problemType == "Addition" {
                    self.mathModel.addition(userSettings: self.userSettings)
                } else if self.mathModel.problemType == "Subtraction" {
                    self.mathModel.subtraction(userSettings: self.userSettings)
                } else if self.mathModel.problemType == "Multiplication" {
                    self.mathModel.multiplication(userSettings: self.userSettings)
                } else if self.mathModel.problemType == "Division" {
                    self.mathModel.division(userSettings: self.userSettings)
                } else {
                    fatalError("Fatal Error")
                }
        
                self.answerDisplay = "??"
                self.mathModel.answerText = ""
                self.newProblem = true
                self.numProblems += 1
                self.rightWrong = ""
        }
        
        
    }
}// ContentView

struct SettingsButton<Destination : View>: View {
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: self.destination){Text("⚙︎").font(.largeTitle)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
