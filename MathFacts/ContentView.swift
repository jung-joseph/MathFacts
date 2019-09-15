//
//  ContentView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/12/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mathModel = MathModel()
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

                        RightWrongView(rightWrong: $rightWrong)
                        Spacer()
                        Text("Score: \(score) / \(numProblems)")
                            .font(.largeTitle)
                            .padding()
                            .foregroundColor(Color.white)
                    }
                    
                    AdditionProblemView(mathModel: mathModel, answerDisplay: $answerDisplay)

                    
                    TextField("Answer", text: $mathModel.answerText).textFieldStyle(RoundedBorderTextFieldStyle()).padding().font(.custom("Arial", size: 40))
                        .keyboardType(.numberPad)
                    
                    AnswerButton(mathModel: mathModel, answerDisplay: $answerDisplay, rightWrong: $rightWrong, newProblem: $newProblem, score: $score)

                    
                    Text("Double Tap For Next Problem")
                        .font(.body)
                        .foregroundColor(Color.white)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    
                    
                }// VStack

            } // ZStack
                .navigationBarItems(trailing: SettingsButton(destination: UserSettingsView(userSettings: UserSettings()) )).foregroundColor(Color.white)
//                .navigationBarItems(trailing:EditButton())

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
