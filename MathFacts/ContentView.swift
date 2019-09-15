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
                    
                    Picker("", selection: self.$mathModel.problemType ) {
                        Text("Addition").tag("Addition").font(.custom("Arial", size: 20))
                        Text("Subtraction").tag("Subtraction").font(.custom("Arial", size: 20))
                        Text("Multiplication").tag("Multiplicaton").font(.custom("Arial", size: 20))
                        Text("Division").tag("Division").font(.custom("Arial", size: 20))
                    }.pickerStyle(SegmentedPickerStyle())
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    
                    
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
                        .keyboardType(.numberPad)
                    
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
                    
                } else if self.mathModel.problemType == "Division" {
                    
                } else {
                
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
