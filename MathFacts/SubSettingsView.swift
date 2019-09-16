//
//  SubSettingsView.swift
//  MathFacts
//
//  Created by Joseph Jung on 9/15/19.
//  Copyright © 2019 Joseph Jung. All rights reserved.
//

import SwiftUI

struct SubSettingsView: View {
    @ObservedObject var userSettings: UserSettings
    var min: Double
    var max: Double
    var body: some View {
        VStack{
            HStack{
                Text("Subtraction min value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.subMinNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)

            }
            Text("\(userSettings.subMinNumber)").foregroundColor(Color.black)
            HStack{
                Text("Subtraction max value").foregroundColor(Color.black)
                Spacer()
            }
            HStack{
                Text(String(format: "%.0f", min)).foregroundColor(Color.black)
                Slider(value: $userSettings.subMaxNumber, in: min...max, step: 5 )
                Text(String(format: "%.0f", max)).foregroundColor(Color.black)

            }
            Text("\(userSettings.subMaxNumber)").foregroundColor(Color.black)
            
            
        }
    }
}

struct SubSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SubSettingsView(userSettings: UserSettings(), min: 0, max: 0)
    }
}
